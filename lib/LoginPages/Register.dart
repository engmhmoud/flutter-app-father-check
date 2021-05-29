import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:parent_check_app/General//Constants.dart';
import 'package:parent_check_app/General//Error/ErrorList.dart';
import 'package:parent_check_app/General//General.dart';
import 'package:parent_check_app/LoginPages/Intro.dart';

import 'package:flutter/material.dart';
import 'package:parent_check_app/Model/User.dart';
import 'package:parent_check_app/controller/UserDAO.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _id = TextEditingController();
  TextEditingController _email = TextEditingController();

  bool _isButtonDisabled = false;
  bool _seen = true;
  var _seen_Icon;

  Color _enabledColor = Colors.blue;
  int index = 0;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textFH = 1.5;
    TextStyle hintStyle = TextStyle(
      height: textFH,
      color: Colors.white54,
      fontSize: 16,
    );
    TextStyle textStyle = TextStyle(
      height: textFH,
      color: Colors.white70,
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
    var global;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Scaffold(
          // backgroundColor: Colors.gr,

          body: Container(
              height: context.size!.height,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //   image: AssetImage("assets/images/login.png"),
              //   fit: BoxFit.cover,
              //   colorFilter: ColorFilter.mode(
              //       Colors.black.withOpacity(1), BlendMode.color),
              // )),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(children: <Widget>[
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                        transform: Matrix4.translationValues(
                            0, -global.iconSize * 1.5, 0),
                        child: Wrap(children: <Widget>[
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

                          normalSizedBox(normalSizedBoxValue),

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
                                    icon: _seen_Icon,
                                    onPressed: () {
                                      changeEye();
                                    }),
                                hintText: ("pass"),
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
                              controller: _id,
                              decoration: buildInputDecoration(
                                hintText: ("id"),
                                hintStyle: hintStyle,
                              ),
                              keyboardType: TextInputType.number,
                              style: textStyle,
                            ),
                          ),
                        ])),
                  )
                ]),
              ))),
    );
  }

  Future<void> _register() async {
    if (_email.text == "" || _email.text == null) {
      General.infoAlert(title: ("email_required"), type: AlertType.warning);
    } else if (_password.text == "" || _password.text == null) {
      General.infoAlert(title: ("pass_required"), type: AlertType.warning);
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
    else if ((await Connectivity().checkConnectivity()) ==
        ConnectivityResult.none) {
      General.showToast(ErrorList.noInternetConnection.myCase,
          color: Constants.color_DANGER);
      return;
    } else {
      UserDAO dao = UserDAO();
      User user = User(
        email: _email.text,
        password: _password.text,
        username: _username.text,
        id: int.tryParse(_id.text),
        firebaseUser: null,
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

  InputDecoration buildInputDecoration({
    required String hintText,
    required TextStyle hintStyle,
    Widget? suffixIcon,
  }) {
    double contPdValue = 10;
    var contPadd = EdgeInsets.only(
      left: contPdValue,
      right: contPdValue,
    );

    return InputDecoration(
      contentPadding: contPadd,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Constants.color_INFO),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Colors.lightGreen[50] ?? Constants.color_INFO),
        borderRadius: BorderRadius.circular(8),
      ),
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
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
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
}
