// import 'package:parent_check_app/General//Constants.dart';
// import 'package:parent_check_app/General//Error/ErrorList.dart';
// import 'package:parent_check_app/General//General.dart';
// import 'package:parent_check_app/General//Services.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:parent_check_app/LoginPages/Register.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   TextEditingController _email = TextEditingController();
//   TextEditingController _password = TextEditingController();
//   bool _seen = true;

//   bool _isButtonDisabled = false;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextStyle hintStyle;
//     TextStyle textStyle;
//     var mainMargin;
//     var loginMargin;
//     var textFH = 1.5;
//     hintStyle = TextStyle(
//       height: textFH,
//       color: Colors.white54,
//       fontSize: global.fontSizeNormal,
//     );
//     textStyle = TextStyle(
//       height: textFH,
//       color: Colors.white70,
//       fontSize: global.getFontSizeNormalMore(),
//       fontWeight: FontWeight.w400,
//     );
//     var index = global.sizingInformation.deviceType.index;
//     if (index == DeviceScreenType.SM.index ||
//         index == DeviceScreenType.MD.index) {
//       mainMargin = EdgeInsets.only(left: 10, right: 10, top: 10); //20
//       loginMargin = EdgeInsets.only(
//         left: 40,
//         right: 40,
//         top: 20,
//         bottom: 10,
//       );
//     } else if (index == DeviceScreenType.MD.index) {
//       mainMargin = EdgeInsets.only(left: 25, right: 25, top: 10); //20
//       loginMargin = EdgeInsets.only(
//         left: 50,
//         right: 50,
//         top: 30,
//         bottom: 15,
//       );
//     } else {
//       mainMargin = EdgeInsets.only(left: 35, right: 35, top: 18); //20
//       loginMargin = EdgeInsets.only(
//         left: 70,
//         right: 70,
//         top: 40,
//         bottom: 25,
//       );
//     }

//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Container(
//           height: global.sizingInformation.screenSize.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//             image: AssetImage("assets/images/login.png"),
//             fit: BoxFit.cover,
//           )),
//           child: Container(
//             margin: mainMargin,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(
//                     height: global.sizingInformation.screenSize.height / 25,
//                   ),
//                   Center(
//                     child: Text(
//                       Service.myString("login"),
//                       // "Login",
//                       style: TextStyle(
//                           fontSize: Intro.global.fontSizeHead * 1.5,
//                           color: Colors.white),
//                     ),
//                   ),
//                   SizedBox(
//                     height: heigth,
//                   ),
//                   Center(
//                     child: Container(
//                         child: General.icon_App(
//                       global.sizingInformation.screenSize.height / 8,
//                     )),
//                   ),
//                   SizedBox(
//                     height: heigth,
//                   ),
//                   Container(
//                     // color: Colors.red,
//                     margin: EdgeInsets.only(
//                         left: global.sizingInformation.screenSize.width / 12,
//                         right: global.sizingInformation.screenSize.width / 12),
//                     child: SizedBox(
//                       height: heigth,
//                       child: Container(
//                         constraints: BoxConstraints(
//                             maxHeight: heigth, minHeight: heigth),
//                         // margin: EdgeInsets.only,
//                         child: TextField(
//                           cursorWidth: 3,
//                           cursorRadius: Radius.circular(3),
//                           // expands: true,
//                           // minLines: null,
//                           // maxLines: null,
//                           onSubmitted: (_) {
//                             _login();
//                           },
//                           controller: _email,
//                           keyboardType: TextInputType.emailAddress,
//                           style: textStyle,
//                           strutStyle: StrutStyle(height: textFH),
//                           decoration: buildInputDecoration(
//                               // removeLeftPadding: true,
//                               hintText: Service.myString("email"),
//                               hintStyle: hintStyle),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height:
//                         global.sizingInformation.screenSize.height / 20 >= 45
//                             ? 45
//                             : global.sizingInformation.screenSize.height / 20,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       Container(
//                         margin: EdgeInsets.only(
//                             left:
//                                 global.sizingInformation.screenSize.width / 12,
//                             right:
//                                 global.sizingInformation.screenSize.width / 12),
//                         child: SizedBox(
//                           height:
//                               global.sizingInformation.screenSize.height / 15,
//                           child: Container(
//                             height:
//                                 global.sizingInformation.screenSize.height / 14,
//                             constraints: BoxConstraints(
//                                 minHeight:
//                                     global.sizingInformation.screenSize.height /
//                                         15,
//                                 maxHeight:
//                                     global.sizingInformation.screenSize.height /
//                                         15),
//                             child: TextField(
//                               cursorWidth: 3,
//                               cursorRadius: Radius.circular(3),
//                               strutStyle: StrutStyle(height: textFH),
//                               scrollPhysics: ScrollPhysics(),
//                               controller: _password,
//                               keyboardType: TextInputType.visiblePassword,
//                               obscureText: _seen,
//                               style: textStyle,
//                               decoration: buildInputDecoration(
//                                   hintText: Service.myString("pass"),
//                                   hintStyle: hintStyle,
//                                   suffixIcon: IconButton(
//                                     icon: _seen_Icon,
//                                     onPressed: () {
//                                       changeEye();
//                                     },
//                                   )),
//                               onSubmitted: (_) {
//                                 _login();
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       // Container(
//                       //   margin: EdgeInsets.only(
//                       //     right: 20,
//                       //     top: 10,
//                       //     left: 20,
//                       //   ),
//                       //   child: InkWell(
//                       //     onTap: () {
//                       //       if (_email.text == null || _email.text == "")
//                       //         General.infoAlert(context,
//                       //             title: "Email Required", text: null);
//                       //       else
//                       //         forgetPassword();
//                       //     },
//                       //     child: Text(
//                       //       // "Forget password?",
//                       //       Service.myString("forget_pass"),
//                       //       style:
//                       //           TextStyle(color: Colors.white60, fontSize: 16),
//                       //       textAlign: TextAlign.end,
//                       //     ),
//                       //   ),
//                       // )
//                     ],
//                   ),
//                   Container(
//                     margin: loginMargin,
//                     decoration: BoxDecoration(
//                       color: _isButtonDisabled
//                           ? Colors.grey
//                           : Constants.color_INFO,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: MaterialButton(
//                       onPressed: _login,
//                       child: Center(
//                           child: Text(
//                         Service.myString("login"),
//                         style: TextStyle(
//                             color: Colors.white, fontSize: global.fontSizeHead),
//                       )),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(
//                         top: global.sizingInformation.screenSize.height / 15),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.max,
//                       // textDirection: TextDirection.ltr,
//                       children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(
//                             left: global.iconSize,
//                             right: global.iconSize,
//                           ),
//                           child: Text(
//                             Service.myString("create_new_account"),
//                             style: textStyle,
//                           ),
//                         ),
//                         InkWell(
//                           child: Text(
//                             Service.myString("sign_up"),
//                             // "Sign Up ",
//                             style: TextStyle(
//                                 color: Constants.color_INFO,
//                                 fontSize: global.fontSizeNormal),
//                           ),
//                           onTap: () => _register(context),
//                         ),
//                       ],
//                     ),
//                   ),
//                   _isButtonDisabled ? General.loadingCircle() : Container(),
//                   // RaisedButton(
//                   //   onPressed: () {
//                   //     UserDAO().getUser(context);
//                   //     Navigator.pushReplacement(
//                   //         context, MaterialPageRoute(builder: (c) => Intro()));
//                   //   },
//                   //   child: Text("data"),
//                   // )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _login() async {
//     // Navigator.pushReplacement(
//     //     context, MaterialPageRoute(builder: (c) => Home()));
//     print("login trioed");
//     if (!_isButtonDisabled) if (_email.text == "" || _email.text == null) {
//       General.infoAlert(
//         context,
//         title: Service.myString("email_required"),
//         text: null,
//         type: AlertType.info,
//         // width: 100,
//       );
//     } else if (_password.text == "" || _password.text == null) {
//       General.infoAlert(
//         context,
//         title: Service.myString("pass_required"),
//         text: null,
//         type: AlertType.info,
//         // width: 100
//       );
//     } else if ((await Connectivity().checkConnectivity()) ==
//         ConnectivityResult.none) {
//       General.showToast(ErrorList.noInternetConnection.myCase,
//           color: Constants.color_DANGER);
//       return;
//     } else {
//       if (mounted)
//         setState(() {
//           _isButtonDisabled = true;
//         });
//       try {
//         await UserDAO().loginUser(email: _email.text, password: _password.text);
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => Home()));
//       } on PlatformException catch (e) {
//         General.infoAlert(context,
//             text: FirebaseAutMapSignIn().getMessage(e.code),
//             type: AlertType.error);
//       } catch (e) {
//         General.infoAlert(context,
//             text: Service.myString("login_failed_check_email_pass"),
//             type: AlertType.error);
//       } finally {
//         if (mounted)
//           setState(() {
//             print(_isButtonDisabled);
//             _isButtonDisabled = false;
//           });
//       }
//     }
//   }

//   void _register(BuildContext context) {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => Register()));
//   }

//   Future<void> forgetPassword() async {
//     if ((await Connectivity().checkConnectivity()) == ConnectivityResult.none) {
//       General.showToast(ErrorList.noInternetConnection.myCase,
//           color: Constants.color_DANGER);
//       return;
//     } else {
//       try {
//         await UserDAO().forgetPassword(_email.text);
//         General.infoAlert(context,
//             title: Service.myString("reset_pass_sended_to_your_email"),
//             type: AlertType.success);
//       } on PlatformException catch (e) {
//         General.infoAlert(context,
//             text: FirebaseAutMapForgetPassword().getMessage(e.code),
//             type: AlertType.error);
//       } catch (e) {
//         print("e========>");
//         print(e);
//         General.infoAlert(context,
//             title: "Error while sending reset to Your Email",
//             text: "Check your email and  Internet connection",
//             type: AlertType.error);
//       }
//     }
//   }

//   InputDecoration buildInputDecoration(
//       {String hintText, TextStyle hintStyle, Widget suffixIcon}) {
//     double contPdValue = 10;
//     var contPadd = EdgeInsets.all(contPdValue);
//     // if (removeLeftPadding) {
//     //   contPadd = EdgeInsets.only(
//     //       left: -global.getIconSizeMore(),
//     //       right: contPdValue,
//     //       bottom: contPdValue,
//     //       top: contPdValue);
//     // }
//     return InputDecoration(
//       contentPadding: contPadd,
//       focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Constants.color_INFO),
//           borderRadius: BorderRadius.circular(8)),
//       enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.lightGreen[50]),
//           borderRadius: BorderRadius.circular(8)),
//       hintText: hintText,
//       hintStyle: hintStyle,
//       suffixIcon: suffixIcon ?? SizedBox(),
//     );
//   }

//   void changeEye() {
//     setState(() {
//       _seen = !_seen;
//       _seen_Icon = General.getEyeIcon(_seen, global.iconSize);
//     });
//   }
// }
