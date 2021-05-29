// import 'dart:io';

// // import 'package:country_pickers/country.dart';
// // import 'package:country_pickers/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'Constants.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/material.dart' as m;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:parent_check_app/General/Constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class General {
//   static Widget icon_App(double size) {
//     return Container(
//       width: size,
//       height: size,
//       child: Image(
//         image: AssetImage("assets/images/icon.png"),
//         fit: BoxFit.cover,
//       ),
//       decoration: BoxDecoration(
//           border: Border.all(
//               color: Colors.white, width: 92 / 8, style: BorderStyle.solid),
//           borderRadius: BorderRadius.all(Radius.circular(10))),
//     );
//   }

  static Widget getEyeIcon(bool check, double iconSize) {
    return !check
        ? Icon((FontAwesomeIcons.solidEye),
            // color: Colors.lightGreen[50],
            // color: Constants.color_INFO,
            size: iconSize)
        : Icon(
            FontAwesomeIcons.eyeSlash,
            color: Constants.color_INFO,
            size: iconSize,
          );
  }

//   static Widget fullIcon_App(double size) {
//     return Container(
//       width: size,
//       height: size,
//       child: Image(
//         image: AssetImage("assets/images/iconWithWord.png"),
//       ),
//     );
//   }

//   static Widget loadingCircle({double? size}) {
//     return Center(child: LoadingRotating.square(
//       itemBuilder: (c, i) {
//         return Icon(
//           FontAwesomeIcons.spinner,
//           color: Constants.color_INFO,
//           size: size ?? 40,
//         );
//       },
//     ));
//   }

  static Future<void> infoAlert(BuildContext context,
      {String? title, String? text, AlertType type = AlertType.info}) async {
    var myCase = text ?? title;

    late Color color;
    if (AlertType.error == type)
      color = Constants.color_DANGER;
    else if (AlertType.info == type)
      color = Constants.color_WARNING;
    else if (AlertType.success == type) color = Constants.color_INFO;
    Fluttertoast.showToast(
        msg: myCase ?? "",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16);
  }

//   static Future<bool> confirmDialog(BuildContext context,
//       {String title, String text, AlertType type}) async {
//     var intro = Intro.global;
//     TextStyle style_text = TextStyle(fontSize: 12);
//     TextStyle style_head = TextStyle(fontSize: 14);

//     // return Alert(
//     //   context: context,
//     //   type: type ?? AlertType.warning,
//     //   title: title,
//     //   desc: text,
//     //   style: AlertStyle(descStyle: style, titleStyle: style),
//     //   buttons: [
//     //     DialogButton(
//     //       child: Text(
//     //         "Ok",
//     //         style: TextStyle(color: Colors.white, fontSize: 10),
//     //       ),
//     //       onPressed: () => Navigator.of(context).pop(true),
//     //       color: Constants.color_INFO,
//     //     ),
//     //     DialogButton(
//     //       color: Constants.color_DANGER,
//     //       child: Text(
//     //         "Cancel",
//     //         style: TextStyle(color: Colors.white, fontSize: 10),
//     //       ),
//     //       onPressed: () => Navigator.of(context).pop(false),
//     //     )
//     //   ],
//     // ).show();
//     return await
//         // showDialog(
//         //         context: context,
//         //         builder: (context) => AlertDialog(
//         //               // title: Center(child: Text('حذف')),
//         //               content: Column(
//         //                 mainAxisSize: MainAxisSize.min,
//         //                 children: <Widget>[
//         //                   Text(
//         //                     "${title ?? ""}",
//         //                     style: style_head,
//         //                   ),
//         //                   Divider(),
//         //                   Text(
//         //                     "${text ?? ""}",
//         //                     style: style_text,
//         //                   ),
//         //                   Wrap(
//         //                     direction: Axis.horizontal,
//         //                     alignment: WrapAlignment.spaceAround,
//         //                     spacing: intro.iconSize,
//         //                     children: <Widget>[
//         //                       RaisedButton(
//         //                         onPressed: () {
//         //                           Navigator.pop(context, false);
//         //                         },
//         //                         child: Text(Service.myString('cancle')),
//         //                       ),
//         //                       RaisedButton(
//         //                         onPressed: () {
//         //                           Navigator.pop(context, true);
//         //                         },
//         //                         child: Text(
//         //                           Service.myString('ok'),
//         //                         ),
//         //                       ),
//         //                     ],
//         //                   )
//         //                 ],
//         //               ),
//         //             ))
//         Alert(
//             context: context,
//             title: "${title ?? ""}",
//             desc: "${text ?? ""}",
//             buttons: [
//               DialogButton(
//                 color: Colors.grey,
//                 child: Text(Service.myString("cancle")),
//                 onPressed: () {
//                   Navigator.pop(context, false);
//                 },
//               ),
//               DialogButton(
//                 child: Text(
//                   Service.myString("yes"),
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context, true);
//                 },
//               ),
//             ]).show() ??
//         false;
//   }

//   static Widget basicDateField(BuildContext context) {
//     final format = DateFormat("yyyy-MM-dd");

//     return Column(
//       children: <Widget>[
//         Text("Test"),
//         DateTimeField(
//           format: format,
//           onShowPicker: (context, currentValue) {
//             return showDatePicker(
//                 context: context,
//                 firstDate: DateTime(1900),
//                 initialDate: currentValue ?? DateTime.now(),
//                 lastDate: DateTime(2100));
//           },
//         ),
//       ],
//     );
//   }

// // Widget buildDropdownItem(Country country, TextStyle style) => Container(
// //       child: Wrap(
// //         crossAxisAlignment: WrapCrossAlignment.center,
// //         children: <Widget>[
// //           CountryPickerUtils.getDefaultFlagImage(country),
// //           SizedBox(
// //             width: 2.0,
// //           ),
// //           Text(
// //             "+${country.phoneCode}(${country.isoCode})",
// //             style: style,
// //           ),
// //         ],
// //       ),
// //     );

//   static ProgressDialog loadingCoponent(BuildContext context, size) {
//     // var higth = context.size.width / 5;
//     var pr = ProgressDialog(context,
//         type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);

//     pr.style(
//         message: 'Loading',
//         borderRadius: 12.0,
//         backgroundColor: Colors.white,
//         progressWidget: LoadingRotating.square(
//           itemBuilder: (c, i) {
//             return Icon(
//               Icons.sync,
//               color: Constants.color_INFO,
//               size: 40,
//             );
//           },
//         ),
//         elevation: 10.0,
//         insetAnimCurve: Curves.easeInOut,
//         progress: 0.0,
//         maxProgress: 100.0,
//         messageTextStyle: TextStyle(color: Constants.color_INFO, fontSize: 12));
//     return pr;
// //===========================================

//     // return showDialog(
//     //     context: context,
//     //     builder: (c) {
//     //       return ConstrainedBox(
//     //         constraints: BoxConstraints(maxWidth: higth),
//     //         // width: higth,
//     //         child: AlertDialog(
//     //             contentPadding: EdgeInsets.all(0),
//     //             shape:
//     //                 // BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     //                 ContinuousRectangleBorder(
//     //                     borderRadius: BorderRadius.circular(30)),
//     //             elevation: 0,
//     //             content: Container(
//     //               height: higth,
//     //               child: Column(
//     //                 children: <Widget>[
//     //                   LoadingRotating.square(
//     //                     itemBuilder: (c, i) {
//     //                       return Icon(
//     //                         Icons.sync,
//     //                         color: Constants.color_INFO,
//     //                         size: 40,
//     //                       );
//     //                     },
//     //                   ),
//     //                   Text(
//     //                     "Loading",
//     //                     style:
//     //                         TextStyle(color: Constants.color_INFO, fontSize: 12),
//     //                   )
//     //                 ],
//     //               ),
//     //             )),
//     //       );
//     //     });
//   }

//   static Widget profileImageByFunc(
//     File file,
//     Function getImage,
//   ) {
//     print(file);
//     print("======================================000000000000");
//     print("======================================000000000000");
//     print(file);
//     double size = Intro.global.iconSize * 8;
//     return Container(
//       width: size,
//       height: size,
//       child: (file != null)
//           ? CircleAvatar(
//               radius: 15,
//               backgroundImage: FileImage(file),
//               backgroundColor: Colors.transparent,
//             )
//           : InkWell(
//               child: CircleAvatar(
//                 radius: 15,
//                 backgroundColor: Constants.color_INFO,
//                 child: Icon(
//                   FontAwesomeIcons.userAlt,
//                   color: Colors.white38,
//                   size: size / 2,
//                 ),
//               ),
//               onTap: getImage,
//             ),
//     );
//   }

//   static Widget snackbarDragger() {
//     var marginLeftDevider = Intro.global.iconSize * 10;
//     var iconSize = Intro.global.iconSize;
//     return Container(
//       margin: EdgeInsets.only(
//           left: marginLeftDevider, right: marginLeftDevider, top: iconSize / 4),
//       width: iconSize * 5,
//       decoration: BoxDecoration(
//           border: Border(
//               top: BorderSide(
//                   color: Colors.black26,
//                   width: iconSize / 5,
//                   style: BorderStyle.solid))),
//     );
//   }

// //toast

  static void showToast(String text, {ToastGravity? gravity, Color? color}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.BOTTOM,
        backgroundColor: color ?? Constants.color_INFO,
        textColor: Colors.white,
        fontSize: 16);
  }

// //Back and Header and WIdget at end if not deault on is set to Center Heder
//   static Widget header(BuildContext context, String header,
//       {Widget rigth, Function back}) {
//     Intro.global.sizingInformation.screenSize = MediaQuery.of(context).size;
//     var global = Intro.global;
//     print("global.iconSize");
//     print(global.iconSize);
//     return Directionality(
//       textDirection: m.TextDirection.ltr,
//       child: Container(
//         alignment: Alignment.center,
//         color: Colors.black,
//         padding: EdgeInsets.only(top: global.getAppbarMargin()),
//         // margin: EdgeInsets.only(left: global.iconSize),
//         // width: double.infinity,
//         height: global.appBarHiegth,
//         child: Container(
//           margin:
//               EdgeInsets.only(left: global.iconSize, right: global.iconSize),
//           child: Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             // mainAxisSize: MainAxisSize.max,
//             // crossAxisAlignment: CrossAxisAlignment.center,
//             // crossAxisAlignment: WrapCrossAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,

//             children: <Widget>[
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: global.sizingInformation.screenSize.width / 3,
//                   child: InkWell(
//                     onTap: () => back ?? Navigator.pop(context),
//                     child: Row(
//                       // alignment: WrapAlignment.center,
//                       // crossAxisAlignment: WrapCrossAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.white70,
//                           size: global.iconSize,
//                         ),
//                         Text(
//                           Service.myString("back"),
//                           // "Back",
//                           style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: global.fontSizeHead),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               header != null
//                   ? Container(
//                       width: global.sizingInformation.screenSize.width / 3,
//                       child: Align(
//                         alignment: Alignment.center,
//                         // flex: 1,
//                         child: Text(
//                           header,
//                           style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: global.fontSizeHead),
//                         ),
//                       ),
//                     )
//                   : Container(),
//               rigth ??
//                   // SizedBox(
//                   //   width: (global.sizingInformation.screenSize.width / 3)
//                   //       ,
//                   // )
//                   Container()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
}
