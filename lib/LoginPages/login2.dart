import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parent_check_app/General/Constants.dart';
import 'package:parent_check_app/General/Error/ErrorList.dart';
import 'package:parent_check_app/General/General.dart';
import 'package:parent_check_app/controller/UserDAO.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Register.dart';
import 'home.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _seen = false;
  bool _isButtonDisabled = false;

  var textStyle = TextStyle(
    height: 10,
    color: Colors.white70,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  var hintStyle = TextStyle(
    height: 10,
    color: Colors.white54,
    fontSize: 12,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              // margin: EdgeInsets.only,
              child: TextField(
                cursorWidth: 3,
                cursorRadius: Radius.circular(3),
                // expands: true,
                // minLines: null,
                // maxLines: null,
                onSubmitted: (_) {
                  _login();
                },
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                style: textStyle,
                strutStyle: StrutStyle(height: 16),
                decoration: buildInputDecoration(hintText: "Email"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (c) => Home()));
    print("login trioed");
    if (!_isButtonDisabled) if (_email.text == "" || _email.text == null) {
      General.infoAlert(
        context,
        title: ("Email is Required"),
        text: null,
        type: AlertType.info,
        // width: 100,
      );
    } else if (_password.text == "" || _password.text == null) {
      General.infoAlert(
        context,
        title: ("Password is Required"),
        text: null,
        type: AlertType.info,
        // width: 100
      );
    } else if ((await Connectivity().checkConnectivity()) ==
        ConnectivityResult.none) {
      General.showToast(ErrorList.noInternetConnection.myCase,
          color: Constants.color_DANGER);
      return;
    } else {
      if (mounted)
        setState(() {
          _isButtonDisabled = true;
        });
      try {
        await UserDAO().loginUser(email: _email.text, password: _password.text);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      } on PlatformException catch (e) {
        General.infoAlert(context,
            text: ("${e.code} ${e.details} ${e.message} ${e.stacktrace}"),
            type: AlertType.error);
      } catch (e) {
        General.infoAlert(context,
            text: "Login failed ${e}", type: AlertType.error);
      } finally {
        if (mounted)
          setState(() {
            print(_isButtonDisabled);
            _isButtonDisabled = false;
          });
      }
    }
  }

  void _register(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }

  InputDecoration buildInputDecoration(
      {required String hintText, Widget? suffixIcon}) {
    double contPdValue = 10;
    var contPadd = EdgeInsets.all(contPdValue);
    // if (removeLeftPadding) {
    //   contPadd = EdgeInsets.only(
    //       left: -global.getIconSizeMore(),
    //       right: contPdValue,
    //       bottom: contPdValue,
    //       top: contPdValue);
    // }
    return InputDecoration(
      contentPadding: contPadd,
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.color_INFO),
          borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen[50]!),
          borderRadius: BorderRadius.circular(8)),
      hintText: hintText,
      hintStyle: hintStyle,
      suffixIcon: suffixIcon ?? SizedBox(),
    );
  }

  // void changeEye() {
  //   setState(() {
  //     _seen = !_seen;
  //     _seen_Icon = General.getEyeIcon(_seen, 16);
  //   });
  // }
}
