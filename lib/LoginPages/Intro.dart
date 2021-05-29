import 'package:after_layout/after_layout.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:parent_check_app/General/General.dart';

import 'package:parent_check_app/LoginPages/home.dart';
import 'package:parent_check_app/controller/UserDAO.dart';

import 'login2.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with AfterLayoutMixin<Intro> {
  // double position = 1;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // Calling the same function "after layout" to resolve the issue.
    login();
  }

  @override
  void initState() {
    super.initState();

    // if (SchedulerBinding.instance.schedulerPhase ==
    //     SchedulerPhase.persistentCallbacks) {
    //   SchedulerBinding.instance.addPostFrameCallback((_) => () {
    //         UserDAO dao = UserDAO();
    //         WidgetsBinding.instance
    //             .addPostFrameCallback((_) => dao.getUser(context));
    //       });
    // }
  }

  @override
  Widget build(BuildContext context) {
    double imageSize = 180;

    double heigthSpace = 120;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("assets/images/login.png"),
        //         fit: BoxFit.cover,
        //         colorFilter: ColorFilter.mode(
        //             Colors.black.withOpacity(1), BlendMode.dstATop))),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: heigthSpace,
            ),

            SizedBox(
              height: heigthSpace,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  // margin: EdgeInsets.only(left: 100, right: 100),
                  child: DotsIndicator(
                dotsCount: 4,
                position: 1,
                decorator: DotsDecorator(
                  spacing: const EdgeInsets.all(10.0),
                  color: Colors.grey,
                  activeColor: Colors.white,
                  size: Size.fromRadius(imageSize / 50),
                  activeSize: Size.fromRadius(imageSize / 50),
                  shape: CircleBorder(),
                ),
              )),
            ),
            // RaisedButton(
            //   onPressed: () {
            //     // FileDAOS.getImageOfProfile(
            //     //     userEmail: "mhmoudsabry25@gmail.com");

            //     Navigator.pushReplacement(
            //         context, MaterialPageRoute(builder: (c) => Login()));
            //   },
            //   child: Text("data"),
            // )
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    UserDAO dao = UserDAO();
    // try {
    dao.currentUser = await dao.getFireUser();
    if (dao.currentUser == null)
      toPage(context, Login2());
    else
      await dao.getUser();
    if (MainData.user == null) {
      toPage(context, Login2());
    } else
      toPage(context, Home());
  }
}
