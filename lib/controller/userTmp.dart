// import 'package:cloud_firestore/cloud_firestore.dart';

// class Temp {
//   static final FirebaseFirestore _store = FirebaseFirestore.instance;

//   static final CollectionReference _usersColec =
//       _store.collection("nameOfCollection");

//   Future<DocumentSnapshot<Object?>> getUserFromCollection(String email) {
//     return _usersColec.doc(email).get();
//   }

//   Future<void> addUserToCollection(model.User user, String email) async {
//     print("in addUserToCollection");
//     await _usersColec.doc(email).set(user.toJSON());
//   }

//   Future<void> deleteUserfromCollection({required String email}) async {
//     print("in deleteUserfromCollection");

//     await _usersColec.doc(email).delete();
//   }
// }
