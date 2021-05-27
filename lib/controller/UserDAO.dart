import 'dart:io';

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
    return _auth.currentUser;
  }

  Future<void> getUser() async {
    MainData.user = model.User.fromSnapshot(
        await getUserFromCollection(currentUser?.email ?? ""), currentUser!);
    if (MainData.user == null) return;
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

  Future<void> addUser(model.User user) async {
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
    _currentUser = loggedInUser.user ?? currentUser;

    addToLocalStore(user);
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
