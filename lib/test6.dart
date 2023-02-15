// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:srec_library/test4.dart';
// import 'package:srec_library/testfinal.dart';
// import 'package:srec_library/testpopz.dart';

// class UserManagement {
//   storeNewUser(user, context) async {
//     var firebaseUser = await FirebaseAuth.instance.currentUser!;
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(firebaseUser.uid)
//         .set({'email': user.email, 'uid': user.uid})
//         .then((value) => Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Home())))
//         .catchError((e) {
//           print(e);
//         });
//   }
// }
