import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parent_check_app/General/General.dart';

class User {
  String? email;
  auth.User? firebaseUser;
  String? username;
  String? password;
  int? id;
  int? temp;
  DateTime? time;
  // String uid;
  User({
    required this.username,
    required this.id,
    required this.email,
    required this.firebaseUser,
    required this.password,
    this.temp,
    this.time,
  });

  User.fromSnapshot(DocumentSnapshot<Object?> snapshot, auth.User fireUser) {
    this.email = snapshot.id;
    this.username = snapshot.get("username");
    this.id = snapshot.get("id");
    this.password = snapshot.get("password");
    this.temp = snapshot.get("temp");
    // this.temp = snapshot.get("temp").toDate();
    if (snapshot.get("time") != null) {
      final Timestamp _timestamp = snapshot.get("time") as Timestamp;
      final DateTime _time = _timestamp.toDate();
      this.time = _time;
    }

    // this.time =Service. snapshot.get("time");
  }

  toJSON() {
    Map<String, dynamic> data = {
      "username": username,
      "password": password,
      "id": id,
      // "time":
    };

    return data;
  }

  @override
  String toString() {
    return "username: $username , " +
        "password: $password," +
        "id: $id , " +
        "temp $temp ," +
        " _time :$time ";
  }
}
