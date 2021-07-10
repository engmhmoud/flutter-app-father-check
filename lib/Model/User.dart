// import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:core';

import 'package:flutter/widgets.dart';

class User {
  int? id;
  String? username;
  String? password;
  double? serialnumber;
  String? gender;
  String? email;
  String? card_uid;
  int? card_select;
  String? user_date;
  String? device_uid;
  String? device_dep;
  String? temp_degree;
  int? add_card;

  User(
      {this.id,
      this.username,
      this.password,
      @required this.serialnumber,
      this.add_card,
      this.user_date,
      this.temp_degree,
      this.gender,
      this.email,
      this.device_uid,
      this.device_dep,
      this.card_uid,
      this.card_select});
  User.fromSnapshot(Map<String, dynamic> data) {
    // this.email = snapshot.id;
    // this.username = snapshot.get("username");
    // this.id = snapshot.get("id");
    // this.password = snapshot.get("password");
    // this.temp = General.tryValue(snapshot, "temp");

    // var _t_fire = General.tryValue(snapshot, "time");
    // if (_t_fire == null)
    //   this.time = null;
    // else {
    //   final Timestamp _timestamp =
    //       General.tryValue(snapshot, "time") as Timestamp;
    //   final DateTime _time = _timestamp.toDate();
    //   this.time = _time;
    // }
    // var map = <String, Object?>{
    //   columnTitle: title,
    //   columnDone: done == true ? 1 : 0,

    // int id;
    // String? username;
    // double? serialnumber;
    // String? gender;
    // String? email;
    // String? card_uid;
    // int? card_select;
    // DateTime? user_date;
    // String? device_uid;
    // String? device_dep;
    // String? temp_degree;
    // int? add_card;
    // var values = data.values;

    this.id = data["id"];
    this.username = data["username"];
    this.password = data["password"];
    this.serialnumber = data["serialnumber"];
    this.gender = data["gender"];
    this.email = data["email"];
    this.card_uid = data["card_uid"];
    this.card_select = data["card_select"];
    this.user_date = data["user_date"];
    this.device_uid = data["device_uid"];
    this.device_dep = data["device_dep"];
    this.temp_degree = data["temp_degree"];
    this.add_card = data["add_card"];
  }

  toJSON() {
    Map<String, Object?> data = {
      "username": username,
      "password": password,
      "serialnumber": serialnumber,
      "gender": gender,
      "email": email,
      "card_uid": card_uid,
      "card_select": card_select,
      "user_date": user_date,
      "device_uid": device_uid,
      "device_dep": device_dep,
      "temp_degree": temp_degree,
      "add_card": add_card,
    };

    return data;
  }

  @override
  String toString() {
    return "${toJSON()}";
  }
}
