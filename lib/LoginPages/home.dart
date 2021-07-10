// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:parent_check_app/General/General.dart';
import 'package:parent_check_app/controller/UserDAO.dart';

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
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   pdo();
      // }),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: UserDAO().getDate(
              UserDAO.current!.username,
              UserDAO.current!.id,
            ),
            builder: (content, data) {
              if (data.hasError || !data.hasData) {
                return Center(
                  child: Text("data has error ${data.error}"),
                );
              } else {
                List _data = data.data as List;
                List<Widget> colItms = _data.map((user_log) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          user_log.temp_degree.toString(),
                        ),
                        user_log.temp_degree >= 37
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent[200],
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    textStyle: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  General.showToast(
                                      "Student Temperature is Grathere Than or equal  37 and he is blocked");
                                },
                                child: Container(
                                  child: Text("Block"),
                                ))
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.greenAccent[200],
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    textStyle: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  General.showToast(
                                      "Student Temperature is Good");
                                },
                                child: Container(
                                  child: Text("Allow"),
                                ))
                      ],
                    ),
                  );
                }).toList();
                return Center(
                  child: Column(
                    children: colItms,
                  ),
                );
              }
            },
          ),
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
