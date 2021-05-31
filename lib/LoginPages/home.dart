import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:parent_check_app/controller/UserDAO.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Stream<DocumentSnapshot> str;
  @override
  void initState() {
    super.initState();
    listen();
  }

  listen() async {
    str = UserDAO.usersColection.doc(MainData.user!.email).snapshots();
    str.listen((event) {
      event.get("temp");
      event.get("date");
    });
  }

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
          StreamBuilder(
              builder: (content, data) {
                if (data.hasError) {
                  return Center(
                    child: Text("data has error ${data.error}"),
                  );
                } else
                  return Center(
                    child: Text("Temp"),
                  );
              },
              stream:
                  UserDAO.usersColection.doc(MainData.user!.email).snapshots())
        ],
      ),
    );
  }

  Future<void> pdo() async {
    print(await FirebaseMessaging.instance.getToken());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
