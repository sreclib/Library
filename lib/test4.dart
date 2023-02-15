// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'firebase_options.dart';

// class Hom extends StatefulWidget {
//   @override
//   _HomState createState() => _HomState();
// }

// class _HomState extends State<Hom> {
//   late String myEmail;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         actions: [
//           IconButton(
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Hom()));
//             },
//             icon: Icon(
//               Icons.person_outline,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: _fetch(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState != ConnectionState.done)
//               return Text("Loading data...Please wait");
//             return Text("Email : $myEmail");
//           },
//         ),
//       ),
//     );
//   }

//   _fetch() async {
//     final firebaseUser = await FirebaseAuth.instance.currentUser!;
//     if (firebaseUser != null) {
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(firebaseUser.uid)
//           .get();

//       var ds;
//       Map<String, dynamic> myEmail = ds.data;
//       print(myEmail);
//     }
//   }
// }
