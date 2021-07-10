import 'package:flutter/cupertino.dart';

class UserLog {
  int? id;
  String? username;
  double? serialnumber;
  String? card_uid;
  String? device_uid;
  String? device_dep;
  String? checkindate;
  String? timein;
  String? timeout;
  double? temp_degree;
  int? card_out;

  UserLog({
    @required this.id,
    @required this.username,
    this.card_uid,
    this.device_uid,
    this.device_dep,
    this.card_out,
    this.checkindate,
    this.serialnumber,
    this.timein,
    this.timeout,
    @required this.temp_degree,
  });
  UserLog.fromSnapshot(Map<String, dynamic> data) {
    this.id = data["id"];
    this.username = data["username"];
    this.card_uid = data["card_uid"];
    this.device_dep = data["device_dep"];
    this.device_uid = data["device_uid"];
    this.card_out = data["card_out"];
    this.serialnumber = data["serialnumber"];
    this.checkindate = data["checkindate"];
    this.timein = data["timein"];
    this.timeout = data["timeout"];
    this.temp_degree = data["temp_degree"];
  }

  toJSON() {
    Map<String, Object?> data = {
      "id": id,
      "username": username,
      "card_uid": card_uid,
      "device_uid": device_uid,
      "device_dep": device_dep,
      "card_out": card_out,
      "serialnumber": serialnumber,
      "checkindate": checkindate,
      "timein": timein,
      "timeout": timeout,
      "temp_degree": temp_degree,
    };

    return data;
  }

  @override
  String toString() {
    return "${toJSON()}";
  }
}
