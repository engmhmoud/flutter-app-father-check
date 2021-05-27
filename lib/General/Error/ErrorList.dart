import 'package:rflutter_alert/rflutter_alert.dart';

import 'MyError.dart';

class ErrorList {
  List<MyError> errors;
  String header;
  AlertType type;
  String details;

  ErrorList(this.errors,
      {this.header = "Error",
      this.type = AlertType.error,
      required this.details});
  Map<String, String> getErrorState() {
    StringBuffer myCase = StringBuffer();
    StringBuffer action = StringBuffer();
    for (MyError item in errors) {
      myCase.write(item.myCase + " ");
      action.write(item.action + " ");
    }
    return {"myCase": myCase.toString(), "action": action.toString()};
  }

  //General Errors
  static MyError noInternetConnection = MyError(
      myCase: "No Internet Connection",
      action: "Check internet connection and try again");
  static MyError errorconnectingToServer = MyError(
      myCase: "Error connecting to Server",
      action: "Check internet connection and try again");
  static MyError duraionTimeOut = MyError(
      myCase: "Taking too long Time",
      action: "Check internet connection and try again");
  //Login||Reigster Errors
  static MyError wrongUserName = MyError(
      myCase: "Wrong Username ", action: "check Your username and try again");
  static MyError wrongPassword = MyError(
      myCase: "Wrong Password ",
      action:
          "Check your password and try again .if you forget your password enter your email and press reset password bellow");

  static MyError emailNotVerified = MyError(
      myCase: "Your Email is Not Verified", action: "Verify your email first");
  static MyError errorAddingUser =
      MyError(myCase: "Error Adding User", action: "Verify your email first");

  //import file error
  static MyError noSpaceAvailable = MyError(
      myCase: "No Space Avilable ",
      action: "Your storage is full ! check your storage and try again ");
  static MyError fileHasTheSameName = MyError(
      myCase: "File has The Same Name",
      action: "File in App has the same name");
  static MyError cannotOpenFile = MyError(
      myCase: "Error oppening or reading File",
      action:
          "there is aproblem  in   reading File  the file, please   try again");
  static MyError errorSavingFile = MyError(
      myCase: "Error saving  ",
      action: "there is aproblem  in   saving the File   , please   try again");
  //save file as image
  static MyError gettingImage = MyError(
      myCase: "Error getting  Image",
      action: "there is aproblem  in   creating image please try again");
  //player Error Audio
  static MyError startingThePlayer = MyError(
      myCase: "Error starting Audio ",
      action: "File may Field  to start please  try again");
  static MyError stoppingThePlayer = MyError(
      myCase: "Error stopping Audio ",
      action: "File may Field to stop please  try again");
}
