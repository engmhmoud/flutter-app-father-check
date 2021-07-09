// class UserDAO with ChangeNotifier {
//   static final FirebaseAuth _auth = FirebaseAuth.instance;
//   static final FirebaseFirestore _store = FirebaseFirestore.instance;
//   static final CollectionReference _usersColec = _store.collection("user");
//   // static final CollectionReference _tempOfUserColec= _store.collection("te");

//   static CollectionReference get usersColection => _usersColec;

//   // CollectionReference get tempOfUserColection => _tempOfUserColec;

//   User? _currentUser;

//   User? get currentUser =>
//       this._currentUser ?? FirebaseAuth.instance.currentUser;

//   set currentUser(User? value) => this._currentUser = value;
//   listen() async {
//     var str = _usersColec.doc(MainData.user!.email).snapshots();
//     str.listen((event) {
//       event.get("temp");
//       event.get("date");
//     });
//   }

//   Future<void> forgetPassword(String email) async {
//     await _auth.sendPasswordResetEmail(email: email);
//   }

//   Future<User?> getFireUser() async {
//     notifyListeners();
//     if (_currentUser != null) return _currentUser;

//     if (_auth.currentUser != null) {
//       _currentUser = _auth.currentUser;
//       return currentUser;
//     }
//     // var result = (await _auth.authStateChanges().toList());
//     // if (result.length > 0) {
//     //   _currentUser = result[0];
//     //   return _currentUser;
//     // }

//     return null;
//   }

//   Future<void> getUser() async {
//     var user = model.User.fromSnapshot(
//         await getUserFromCollection(currentUser?.email ?? ""), currentUser!);
//     MainData.user = user;
//     // addToLocalStore(user);
//   }

//   // wrapping the firebase calls
//   // Future logout() async {
//   //   var result = await FirebaseAuth.instance.signOut();
//   //   notifyListeners();
//   //   return result;
//   // }

//   /// `email` String
//   /// `password` String
//   ///
//   Future<void> loginUser(
//       {required String email, required String password}) async {
//     print("login in -----------");
//     var auth = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password)
//         .timeout(Duration(seconds: 40));
//     _currentUser = auth.user!;

//     print("auth $auth");
//     if (currentUser!.email != null) {
//       var documentSnapshot =
//           await getUserFromCollection(currentUser!.email ?? "")
//               .timeout(Duration(seconds: 40));

//       MainData.user = model.User.fromSnapshot(documentSnapshot, currentUser!);
//     }
//     notifyListeners();
//   }

//   Future<DocumentSnapshot<Object?>> getUserFromCollection(String email) {
//     return _usersColec.doc(email.toLowerCase()).get();
//   }

//   Future<void> addUserToCollection(model.User user, String email) async {
//     print("in addUserToCollection");
//     await _usersColec.doc(email).set(user.toJSON());
//   }

//   Future<void> deleteUserfromCollection({required String email}) async {
//     print("in deleteUserfromCollection");

//     await _usersColec.doc(email).delete();
//   }

//   Future<bool?> addUser(model.User user) async {
//     // var error = (e) {
//     //   throw Exception(e);
//     // };
//     // try {
//     var loggedInUser = await _auth.createUserWithEmailAndPassword(
//         email: user.email ?? "", password: user.password ?? "");
//     // var loggedInUser = _auth.currentUser;
//     //to send email Verified
//     // await loggedInUser.user.sendEmailVerification();

//     await addUserToCollection(user, user.email!.toLowerCase());
//     await loginUser(email: user.email ?? "", password: user.password ?? "");

//     MainData.user = user;
//     _currentUser = loggedInUser.user;

//     // addToLocalStore(user);
//     return true;
//     // } on FirebaseAuthException catch (e) {
//     //   if (e.code == 'weak-password') {
//     //     print('The password provided is too weak.');
//     //   } else if (e.code == 'email-already-in-use') {
//     //     print('The account already exists for that email.');
//     //   } else {
//     //     return error(e);
//     //   }
//     // } catch (e) {
//     //   return error(e);
//     // }
//   }

//   Future<bool> signOut() async {
//     print("(await _auth.currentUser()) ${(_auth.currentUser)}");
//     if ((_auth.currentUser) != null) {
//       await _auth.signOut();
//       MainData.user = null;
//       // removeFromLocalStore();
//       return true;
//     }
//     if ((_auth.currentUser) != null) {
//       return false;
//     }
//     notifyListeners();
//     return false;
//   }

//   Future<void> resetPass(String email) async {
//     await _auth.sendPasswordResetEmail(email: email);
//   }

//   // Future<model.User> getFromLocalStore() async {
//   //   var box = Hive.box('myBox');
//   //   var email = await box.get('email');
//   //   var password = await box.get('password');
//   //   var id = await box.get('id');
//   //   var username = await box.get('username');

//   //   return model.User(
//   //       email: email,
//   //       password: password,
//   //       id: id,
//   //       username: username,
//   //       firebaseUser: currentUser);
//   // }

//   // Future<void> addToLocalStore(model.User user) async {
//   //   // to Store data locally to auto login if firebase doesnot login automatically
//   //   // or to get user data from locally without needs of firestore
//   //   var box = await Hive.openBox("myBox");
//   //   // var box = Hive.box('myBox');
//   //   await box.put('email', user.email);
//   //   await box.put('password', user.password);
//   //   await box.put('id', user.id);
//   //   await box.put('username', user.username);
//   //   await box.close();
//   // }

//   // Future<void> removeFromLocalStore() async {
//   //   var box = Hive.box('myBox');
//   //   await box.deleteAll(["email", "password", "id", "username"]);
//   //   await box.close();
//   // }

import 'package:parent_check_app/Model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class UserDAO {
  static Database? db;
  User? current;
  Future<User?> autoLogin() async {
    if (db == null) await openDB();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.get("username");
    var password = prefs.get("password");
    // if (username == null || password == null)
    return null;
    // else
    {
      // return (await getUser(username, password));
    }
  }

  Future<Database?> openDB() async {
    if (db == null)
      db = await openDatabase('my_db.db', onCreate: (_db, val) async {
        var line1 =
            "CREATE TABLE `admin` (  `id` INTEGER    PRIMARY KEY AUTOINCREMENT ,  `admin_name` varchar(30)  ,  `admin_email` varchar(80)  ,  `admin_pwd` longtext  )";
        var line2 =
            "INSERT INTO `admin` (`id`, `admin_name`, `admin_email`, `admin_pwd`) VALUES(1, 'Admin', 'admin@gmail.com', 'admin');";
        var line3 =
            "CREATE TABLE `devices` (  `id` INTEGER    PRIMARY KEY AUTOINCREMENT,  `device_name` varchar(50)  ,  `device_dep` varchar(20)  ,  `device_uid` text  ,  `device_date` date  ,`device_mode` tinyint(1)   DEFAULT 0) ";

        var line4 =
            "INSERT INTO `devices` (`id`, `device_name`, `device_dep`, `device_uid`, `device_date`, `device_mode`) VALUES(1, 'D1', 'test', 'a7ec812d2bf1866b', '2021-06-01', 1);";
        var line5 = "CREATE TABLE `users` ( " +
            "`id` INTEGER    PRIMARY KEY  AUTOINCREMENT," +
            "`password` varchar(30)   DEFAULT 'None'," +
            "`username` varchar(30)   DEFAULT 'None'," +
            "`serialnumber` double   DEFAULT 0, " +
            "`gender` varchar(10)   DEFAULT 'None'," +
            "`email` varchar(50)   DEFAULT 'None'," +
            "`card_uid` varchar(30) ," +
            "`card_select` tinyint(1)   DEFAULT 0, " +
            "`user_date` date , " +
            "`device_uid` varchar(20)   DEFAULT '0'," +
            "`device_dep` varchar(20)   DEFAULT '0', " +
            "`temp_degree` text  ," +
            "`add_card` tinyint(1)  DEFAULT 0) ";
        var line6 = "INSERT INTO `users` (`id`, `username`, `password`, `serialnumber`, `gender`, `email`, `card_uid`, `card_select`, `user_date`, `device_uid`, `device_dep`, `temp_degree`, `add_card`) " +
            "VALUES(1, 'None','', 0, 'None', 'None', '48237127165', 0, '2021-06-01', 'a7ec812d2bf1866b', 'test', '0', 0)," +
            "(2, 'mahmoud', 4,'', 'Male', 'mo33@g', '205245171139', 0, '2021-06-01', 'a7ec812d2bf1866b', 'test', '30', 1)," +
            "(3, 'mohamed ahmed','',3, 'Male', 'mo@g.com', '11251212219', 0, '2021-06-01', 'a7ec812d2bf1866b', 'test', '31', 1)," +
            "(4, 'ahmed','',2, 'Male', 'ahmed@g.com', '26137172139', 0, '2021-06-01', 'a7ec812d2bf1866b', 'test', '32', 1)," +
            "(5, 'yousef badr','', 1, 'Male', 'yousef.keto5523@gmail.com', '2115172139', 1, '2021-06-01', 'a7ec812d2bf1866b', 'test', '33', 1);";
        var line7 =
            "CREATE TABLE `users_logs` (  `id` INTEGER     PRIMARY KEY AUTOINCREMENT,  `username` varchar(100)  ,  `serialnumber` double  ,  `card_uid` varchar(30)  ,  `device_uid` varchar(20)  ,`device_dep` varchar(20)  ,  `checkindate` date  ,  `timein` time  ,  `timeout` time  ,  `card_out` tinyint(1)   DEFAULT 0,  `temp_degree` double  ) ";
        var line8 = "INSERT INTO `users_logs` " +
            "(`id`, `username`, `serialnumber`, `card_uid`, `device_uid`, `device_dep`, `checkindate`, `timein`, `timeout`, `card_out`, `temp_degree`)" +
            " VALUES" +
            " (13, 'yousef badr', 1, '2115172139', 'a7ec812d2bf1866b', 'test','2021-06-02', '02:38:26', '00:00:00', 0, 38)" +
            ",(14, 'mahmoud', 4, '205245171139', 'a7ec812d2bf1866b', 'test', '2021-06-02', '02:46:46', '02:46:48', 1, 35)" +
            ",(15, 'ahmed', 2, '26137172139', 'a7ec812d2bf1866b', 'test', '2021-06-02', '02:47:27', '02:51:31', 1, 35)" +
            ",(16, 'mahmoud', 4, '205245171139', 'a7ec812d2bf1866b', 'test', '2021-06-02', '02:49:26', '00:00:00', 0, 30.09)" +
            ",(17, 'mohamed ahmed', 3, '11251212219', 'a7ec812d2bf1866b', 'test', '2021-06-02', '02:49:35', '02:51:39', 1, 30.05)" +
            ",(18, 'mohamed ahmed', 3, '11251212219', 'a7ec812d2bf1866b', 'test', '2021-06-02', '02:51:47', '00:00:00', 0, 37.31);";
        // var line9 = "ALTER TABLE `admin`  ADD PRIMARY KEY (`id`);";
        // var line10 = "ALTER TABLE `devices`  ADD PRIMARY KEY (`id`);";
        // var line11 = "ALTER TABLE `users`  ADD PRIMARY KEY (`id`);";
        // var line12 = "ALTER TABLE `users_logs`  ADD PRIMARY KEY (`id`);";
        // var line13 =
        //     "ALTER TABLE `admin`  MODIFY `id` int(11) NOT NULL AUTOINCREMENT, AUTOINCREMENT=2;";
        // var line14 =
        //     "ALTER TABLE `devices`  MODIFY `id` int(11) NOT NULL AUTOINCREMENT, AUTOINCREMENT=2;";
        // var line15 =
        //     "ALTER TABLE `users`  MODIFY `id` int(11) NOT NULL AUTOINCREMENT, AUTOINCREMENT=6;";
        // var line16 =
        //     " ALTER TABLE `users_logs` MODIFY `id` int(11) NOT NULL AUTOINCREMENT, AUTOINCREMENT=19;";
        var line17 = "COMMIT;";
        await _db.execute(line1);
        await _db.execute(line2);
        await _db.execute(line3);
        await _db.execute(line4);
        await _db.execute(line5);
        await _db.execute(line6);
        await _db.execute(line7);
        await _db.execute(line8);
        // await _db.execute(line9);
        // await _db.execute(line10);
        // await _db.execute(line11);
        // await _db.execute(line12);
        // await _db.execute(line13);
        // await _db.execute(line14);
        // await _db.execute(line15);
        // await _db.execute(line16);
        // await _db.execute(line17);
      }, version: 5);

    return db;
  }

  Future<void> addUser(User user) async {
    var insert =
        "INSERT INTO  'users' (   'username', 'serialnumber', 'email'  , 'password')" +
            "VALUES( '${user.username}' , '${user.serialnumber}' , '${user.email}' , '${user.password}')";
    await db!.execute(insert);
  }

  Future<User?> getUser(username, pass) async {
    User? user;
    var sql =
        "Select * from 'users' where  username  = '$username' and  password  = '$pass' ";
    var res = await db?.rawQuery(sql);
    if (res != null && res.length >= 0) {
      user = User.fromSnapshot(res.first);
      MainData.user = user;
    }
    return user;
  }

  Future<void> closeDB() async {
    db!.close();
  }

// }

}

class MainData {
  static User? user;
}
