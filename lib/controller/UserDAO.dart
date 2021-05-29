import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:parent_check_app/Model/User.dart' as model;

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class UserDAO with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  User? _currentUser;

  User? get currentUser =>
      this._currentUser ?? FirebaseAuth.instance.currentUser;

  set currentUser(User? value) => this._currentUser = value;

  Future<void> forgetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<User?> getFireUser() async {
    notifyListeners();
    if (_currentUser != null) return _currentUser;

    if (_auth.currentUser != null) {
      _currentUser = _auth.currentUser;
      return currentUser;
    }
    var result = (await _auth.authStateChanges().toList());
    if (result.length > 0) {
      _currentUser = result[0];
      return _currentUser;
    }
  }

  Future<void> getUser() async {
    var user = model.User.fromSnapshot(
        await getUserFromCollection(currentUser?.email ?? ""), currentUser!);
    MainData.user = user;
    addToLocalStore(user);
  }

  // wrapping the firebase calls
  // Future logout() async {
  //   var result = await FirebaseAuth.instance.signOut();
  //   notifyListeners();
  //   return result;
  // }

  /// `email` String
  /// `password` String
  ///
  Future<void> loginUser(
      {required String email, required String password}) async {
    print("login in -----------");
    var auth = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .timeout(Duration(seconds: 40));
    _currentUser = auth.user!;

    print("auth $auth");
    if (currentUser!.email != null) {
      var documentSnapshot =
          await getUserFromCollection(currentUser!.email ?? "")
              .timeout(Duration(seconds: 40));

      MainData.user = model.User.fromSnapshot(documentSnapshot, currentUser!);
    }
    notifyListeners();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserFromCollection(
      String email) {
    return _store.doc(email).get();
  }

  Future<void> addUserToCollection(model.User user, String email) async {
    print("in addUserToCollection");
    await _store.doc(email).set(user.toJSON());
  }

  Future<void> deleteUserfromCollection({required String email}) async {
    print("in deleteUserfromCollection");

    await _store.doc(email).delete();
  }

  Future<bool?> addUser(model.User user) async {
    var error = (e) {
      throw Exception(e);
    };
    try {
      var loggedInUser = await _auth.createUserWithEmailAndPassword(
          email: user.email ?? "", password: user.password ?? "");
      //to send email Verified
      // await loggedInUser.user.sendEmailVerification();

      await addUserToCollection(
          user, loggedInUser.user?.email ?? user.email ?? "");
      await loginUser(
          email: loggedInUser.user?.email ?? user.email ?? "",
          password: user.password ?? "");

      MainData.user = user;
      _currentUser = loggedInUser.user;

      addToLocalStore(user);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        return error(e);
      }
    } catch (e) {
      return error(e);
    }
  }

  Future<bool> signOut() async {
    print("(await _auth.currentUser()) ${(_auth.currentUser)}");
    if ((_auth.currentUser) != null) {
      await _auth.signOut();
      MainData.user = null;
      removeFromLocalStore();
      return true;
    }
    if ((_auth.currentUser) != null) {
      return false;
    }
    notifyListeners();
    return false;
  }

  Future<void> resetPass(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<model.User> getFromLocalStore() async {
    var box = Hive.box('myBox');
    var email = await box.get('email');
    var password = await box.get('password');
    var id = await box.get('id');
    var username = await box.get('username');

    return model.User(
        email: email,
        password: password,
        id: id,
        username: username,
        firebaseUser: currentUser);
  }

  Future<void> addToLocalStore(model.User user) async {
    // to Store data locally to auto login if firebase doesnot login automatically
    // or to get user data from locally without needs of firestore
    var box = Hive.box('myBox');
    await box.put('email', user.email);
    await box.put('password', user.password);
    await box.put('id', user.id);
    await box.put('username', user.username);
    await box.close();
  }

  Future<void> removeFromLocalStore() async {
    var box = Hive.box('myBox');
    await box.deleteAll(["email", "password", "id", "username"]);
    await box.close();
  }
}

class MainData {
  static model.User? user;
}
