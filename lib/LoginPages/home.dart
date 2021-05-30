import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        children: [],
      ),
    );
  }

  Future<void> pdo() async {
    print(await FirebaseMessaging.instance.getToken());
  }
}
