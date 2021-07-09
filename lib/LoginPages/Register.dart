import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parent_check_app/General//Constants.dart';
import 'package:parent_check_app/General//Error/ErrorList.dart';
import 'package:parent_check_app/General//General.dart';
import 'package:parent_check_app/LoginPages/Intro.dart';
import 'package:parent_check_app/LoginPages/login2.dart';
import 'package:parent_check_app/Model/user.dart';
import 'package:parent_check_app/controller/UserDAO.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Register2 extends StatefulWidget {
  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  TextEditingController _serialnumber = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();

  bool _isButtonDisabled = false;
  bool _seen = true;
  var _seen_Icon;

  Color _enabledColor = Colors.blue;
  int index = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var textFH = 1.5;
    TextStyle hintStyle = TextStyle(
      height: textFH,
      color: Colors.black,
      fontSize: 14,
    );
    TextStyle textStyle = TextStyle(
      height: textFH,
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    var strutStyle = StrutStyle(height: textFH);

    double sizedBoxHigth;
    var marginContainer;
    double normalSizedBoxValue;
    double textFieldHigth;
    SizedBox sizedBox;

    marginContainer = EdgeInsets.only(
      // top: 40,
      right: 40,
      left: 40,
    );
    textFieldHigth = 60;
    sizedBoxHigth = 80;
    normalSizedBoxValue = 30;
    sizedBox = SizedBox(
      height: 8,
    );

    // textFieldHigth = global.sizingInformation.screenSize.height / 15;

    sizedBoxHigth = textFieldHigth;

    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          centerTitle: true,
          // leading: Container(),to remove back button
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(children: <Widget>[
            normalSizedBox(sizedBoxHigth),
            mainSizeBox(
                context: context,
                sizedBoxHigth: sizedBoxHigth,
                marginContainer: marginContainer,
                textField: TextField(
                    cursorWidth: 3,
                    cursorRadius: Radius.circular(3),
                    strutStyle: strutStyle,
                    controller: _username,
                    decoration: buildInputDecoration(
                      hintText: ("username"),
                      hintStyle: hintStyle,
                      suffixIcon: null,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: textStyle),
                textFieldHigth: textFieldHigth),
            normalSizedBox(normalSizedBoxValue),

            mainSizeBox(
              context: context,
              sizedBoxHigth: sizedBoxHigth,
              textFieldHigth: textFieldHigth,
              marginContainer: marginContainer,
              textField: TextField(
                strutStyle: strutStyle,
                cursorWidth: 3,
                cursorRadius: Radius.circular(3),
                textDirection: TextDirection.ltr,
                controller: _email,
                decoration: buildInputDecoration(
                  hintText: ("email"),
                  hintStyle: hintStyle,
                ),
                keyboardType: TextInputType.emailAddress,
                style: textStyle,
              ),
            ),
            normalSizedBox(normalSizedBoxValue),
            mainSizeBox(
              context: context,
              marginContainer: marginContainer,
              sizedBoxHigth: sizedBoxHigth,
              textFieldHigth: textFieldHigth,
              textField: TextField(
                strutStyle: strutStyle,
                cursorWidth: 3,
                cursorRadius: Radius.circular(3),
                controller: _password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _seen,
                style: textStyle,
                decoration: buildInputDecoration(
                  suffixIcon: IconButton(
                      icon: _seen_Icon ?? Container(),
                      onPressed: () {
                        changeEye();
                      }),
                  hintText: ("password"),
                  hintStyle: hintStyle,
                ),
              ),
            ),
            normalSizedBox(normalSizedBoxValue),
            // mainSizeBox(context: context,marginContainer: marginContainer,sizedBoxHigth: sizedBoxHigth,textFieldHigth: textFieldHigth,textField:

            // ),
            mainSizeBox(
              context: context,
              marginContainer: marginContainer,
              sizedBoxHigth: sizedBoxHigth,
              textFieldHigth: textFieldHigth,
              textField: TextField(
                strutStyle: strutStyle,
                cursorWidth: 3,
                cursorRadius: Radius.circular(3),
                controller: _serialnumber,
                decoration: buildInputDecoration(
                  hintText: ("id"),
                  hintStyle: hintStyle,
                ),
                keyboardType: TextInputType.number,
                style: textStyle,
              ),
            ),

            Container(
              margin: EdgeInsets.all(40),
              width: 100,
              child: ElevatedButton(
                  onPressed: _register,
                  child: Container(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 120, right: 120, top: 20),
              width: 100,
              child: ElevatedButton(
                  onPressed: _login,
                  child: Container(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          ]),
        ));
  }

  Future<void> _register() async {
    // var path = UserDAO.db!.path;
    // var f = File.fromUri(Uri.file(path));
    // print(UserDAO.db!.isOpen);
    // await UserDAO.db!.close();

    // print(await f.exists());

    // await f.delete();
    // return;

    if (_email.text == "" || _email.text == null) {
      General.infoAlert(title: ("Email is Required"), type: AlertType.warning);
    } else if (_password.text == "" || _password.text == null) {
      General.infoAlert(
          title: ("Password is Required"), type: AlertType.warning);
    } else if (_username.text == "" || _username.text == null) {
      General.infoAlert(
          title: ("Username is Required"),
          // text: onError.toString(),
          type: AlertType.warning);
    }
    //  else if (_image == null) {
    //   General.infoAlert(context,
    //       title:  ("image_required"), type: AlertType.warning);
    // }
    // else if ((await Connectivity().checkConnectivity()) ==
    //     ConnectivityResult.none) {
    //   General.showToast(ErrorList.noInternetConnection.myCase,
    //       color: Constants.color_DANGER);
    //   return;
    // }
    else {
      UserDAO dao = UserDAO();
      User user = User(
        username: _username.text,
        email: _email.text,
        serialnumber: double.parse(_serialnumber.text),
        password: _password.text,
      );
      try {
        await dao.addUser(user);
        Navigator.push(context, MaterialPageRoute(builder: (C) => Intro()));
      } on TimeoutException catch (e) {
        General.showToast(
          ErrorList.duraionTimeOut.myCase,
          color: Constants.color_DANGER,
        );
      } on PlatformException catch (e) {
        General.infoAlert(
            text: ("${e.code} ${e.message}  ${e.details}"),
            type: AlertType.error);
      } catch (e) {
        print("e $e");
        General.showToast(
          ("create_user_filed  $e"),
          color: Constants.color_DANGER,
        );
      }

      if (mounted)
        setState(() {
          isLoading = false;
        });
    }
  }

  InputDecoration buildInputDecoration(
      {required String hintText,
      required TextStyle hintStyle,
      Widget? suffixIcon}) {
    double contPdValue = 10;
    var contPadd = EdgeInsets.only(left: contPdValue, right: contPdValue);

    return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.color_INFO),
          borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.lightGreen[50] ?? Constants.color_INFO),
          borderRadius: BorderRadius.circular(8)),
      hintText: hintText,
      hintStyle: hintStyle,
      suffixIcon: suffixIcon ?? SizedBox(),
    );
  }

  back(BuildContext context) {
    Navigator.pop(context);
  }

  Widget mainSizeBox(
      {required BuildContext context,
      required double sizedBoxHigth,
      required double textFieldHigth,
      EdgeInsetsGeometry? marginContainer,
      required TextField textField}) {
    return SizedBox(
      height: sizedBoxHigth,
      child: Container(
          constraints: BoxConstraints(
              maxHeight: textFieldHigth, minHeight: textFieldHigth),
          margin: marginContainer,
          height: textFieldHigth,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black38, width: 2, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: textField),
    );
  }

  Widget normalSizedBox(double sizedBoxHigth) {
    return SizedBox(
      height: sizedBoxHigth,
    );
  }

  void changeEye() {
    setState(() {
      _seen = !_seen;

      _seen_Icon = General.getEyeIcon(_seen, 16);
      print("_seen_Icon.icon:${_seen_Icon.icon}");
    });
  }

  void _mainRigster() {
    if (!isLoading) {
      if (mounted)
        setState(() {
          isLoading = true;
        });
      _register();
    }
  }

  void _login() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login2()));
  }
}
