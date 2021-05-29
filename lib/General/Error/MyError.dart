// import 'package:rflutter_alert/rflutter_alert.dart';

class MyError {
  String myCase;
  String action;
  // String details;
  // AlertType type;
  MyError({
    required this.myCase,
    required this.action,
    //  this.details, this.type
  }) {
    // if (type == null) {
    //   type = AlertType.error;
    // }
  }

  // void addToTitle(String add) {
  //   title = title + " " + add;
  // }

  // void addToText(String add) {
  //   text = text + " " + add;
  // }
  @override
  String toString() {
    return "$myCase , $action";
  }
}
