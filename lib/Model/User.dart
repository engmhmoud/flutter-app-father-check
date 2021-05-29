import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? email;
  auth.User? firebaseUser;
  String? username;
  String? password;
  int? id;
  // String uid;
  User({
    required this.username,
    required this.id,
    required this.email,
    required this.firebaseUser,
    required this.password,
  });

  User.fromSnapshot(DocumentSnapshot<Object?> snapshot, auth.User fireUser) {
    firebaseUser = fireUser;
    // if (snapshot == null || snapshot.data == null || !snapshot.exists) {
    //   username = fireUser.displayName;
    //   email = fireUser.email;
    // } else
    {
      this.email = snapshot.id;
      this.username = snapshot.get("username");
      this.id = snapshot.get("id");
      this.password = snapshot.get("password");
    }
  }

  toJSON() {
    Map<String, dynamic> data = {
      "username": username,
      "password": password,
      "id": id,
    };

    return data;
  }

  @override
  String toString() {
    return "username: $username , " + "password: $password," + "id: $id," + "";
  }
}
