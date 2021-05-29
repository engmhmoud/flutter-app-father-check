import 'package:after_layout/after_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:parent_check_app/General/General.dart';
import 'package:parent_check_app/LoginPages/Intro.dart';
import 'package:parent_check_app/LoginPages/login2.dart';
import 'package:parent_check_app/controller/UserDAO.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  General.infoAlert(
      text: message.notification!.body,
      title: message.notification!.title,
      type: AlertType.info);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(Intro());
}

// class Intro extends StatefulWidget {
//   @override
//   _IntroState createState() => _IntroState();
// }

// class _IntroState extends State<Intro> with AfterLayoutMixin<Intro> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       children: [],
//     ));
//   }

//   @override
//   void afterFirstLayout(BuildContext context) {
//     General.loadingCoponent(context);
//     loadUser();
//   }

//   Future<void> loadUser() async {
//     var dao = UserDAO();
//     var user = await dao.getFireUser();
//     if (user == null) {
//       toPage(context, Login2());
//       dao.getUser();
//     }
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> _incrementCounter() async {
    var token = await FirebaseMessaging.instance.getToken();
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text("$_counter")),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Column(
              children: [],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
