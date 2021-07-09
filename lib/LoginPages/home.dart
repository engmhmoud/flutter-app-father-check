// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late Stream<DocumentSnapshot> str;

  @override
  void initState() {
    super.initState();
    // listen();
  }

  // listen() async {
  //   str = UserDAO.usersColection.doc(MainData.user!.email).snapshots();
  //   str.listen((event) {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        pdo();
      }),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(
        children: [
          // StreamBuilder(
          //   stream:
          //       UserDAO.usersColection.doc(MainData.user!.email).snapshots(),
          //   builder: (content, AsyncSnapshot<DocumentSnapshot> data) {
          //     if (data.hasError || !data.hasData) {
          //       return Center(
          //         child: Text("data has error ${data.error}"),
          //       );
          //     } else {
          //       var _data = data.data!;
          //       return Center(
          //         child: Column(
          //           children: [
          //             Text("Temp ${General.tryValueNotNull(_data, "temp")}"),
          //             Text("Date ${General.tryValueNotNull(_data, "time")}"),
          //           ],
          //         ),
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }

  Future<void> pdo() async {
    // UserDAO().current;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
