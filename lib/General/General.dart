import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animations/loading_animations.dart';

import 'package:parent_check_app/General/Constants.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class General {
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

  static Future<void> infoAlert(
      {String? title, String? text, AlertType type = AlertType.info}) async {
    var myCase = text ?? title;

    Color color;
    if (AlertType.error == type)
      color = Constants.color_DANGER;
    else if (AlertType.info == type)
      color = Constants.color_WARNING;
    else
      color = Constants.color_INFO;
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

  // static   loadingCoponent(BuildContext context) {
  //     return showDialog(
  //     context: context,
  //     builder: (context) =>
  //         ProgressDialog(getFuture()),
  //   );
  // }

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

void toPage(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}
