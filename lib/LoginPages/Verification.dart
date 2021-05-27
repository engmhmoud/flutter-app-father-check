import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parent_check_app/General/Constants.dart';

class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  var __controller_1 = TextEditingController();

  var __controller_2 = TextEditingController();

  var __controller_3 = TextEditingController();

  var __controller_4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _imageSize = 150;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.4), BlendMode.dstATop))),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Header(context),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.white30,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                child: profileImage(),
                height: _imageSize,
                width: _imageSize * 5 / 6,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                ("verify_your_email"),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white)),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: __controller_1,
                  ),
                  width: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white)),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: __controller_1,
                  ),
                  width: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white)),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: __controller_1,
                  ),
                  width: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white)),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: __controller_1,
                  ),
                  width: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _Verify() {}

  Widget Header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.arrow_left,
              color: Colors.white,
            ),
            GestureDetector(
              onTap: () {
                print("object");
                back(context);
              },
              child: Text(
                ("back"),
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        Text(
          ("verification"),
          style: TextStyle(color: Colors.white),
        ),
        InkWell(
          onTap: () {
            _Verify();
          },
          child: Text(
            ("next"),
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

back(BuildContext context) {
  print("object");
  Navigator.of(context).pop();
}

Widget profileImage() {
  return CircleAvatar(
      backgroundColor: Constants.color_INFO,
      radius: 15,
      // backgroundColor: Colors.transparent,
      child: Icon(
        FontAwesomeIcons.check,
        size: 40,
        color: Colors.white,
      ));
}
