// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:srec_library/Auth.dart';
// import 'package:srec_library/Fpasswrd.dart';
// import 'package:srec_library/Fpasswrd.dart';
// import 'package:srec_library/Fpasswrd.dart';
// import 'package:srec_library/testpopz.dart';

// class My_book extends StatefulWidget {
//   final currentUser = FirebaseAuth.instance;
//   @override
//   _My_bookState createState() => _My_bookState();
// }

// class _My_bookState extends State<My_book> {
//   final controllerBookName = TextEditingController();
//   final controllerBookId = TextEditingController();
//   final controllerAuthorName = TextEditingController();
//   final controllerPublisherName = TextEditingController();
//   final controllerEdition = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 156, 83, 230),
//           title: Text("Library"),
//           actions: <Widget>[
//             IconButton(
//                 onPressed: () async {
//                   await FirebaseAuth.instance.signOut();
//                 },
//                 icon: Icon(Icons.logout_outlined))
//           ]),
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 70),
//             child: StreamBuilder<List<User>>(
//               stream: readBookdata(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return Text('Something went wrong! ${snapshot.error}');
//                 } else if (snapshot.hasData) {
//                   final User = snapshot.data!;

//                   return ListView.separated(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     physics: BouncingScrollPhysics(),
//                     itemCount: User.length,
//                     itemBuilder: (context, i) {
//                       return ExpansionTile(
//                         textColor: Colors.black,
//                         // textColor: Color.fromARGB(255, 156, 83, 230),

//                         iconColor: Color.fromARGB(255, 79, 18, 80),

//                         title: Text(
//                           snapshot.data![i].name,
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         children: <Widget>[
//                           Wrap(
//                             alignment: WrapAlignment.start,
//                             runAlignment: WrapAlignment.start,
//                             textDirection: TextDirection.ltr,
//                             children: [
//                               Container(
//                                 margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                 child: Text(
//                                   textAlign: TextAlign.left,
//                                   'Author Name : ' + snapshot.data![i].name,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                 child: Text(
//                                   ', Book Id : ' + snapshot.data![i].name,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 child: Text(
//                                   ', Edition : ' + snapshot.data![i].name,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 child: Text(
//                                   ', Publisher Name : ' +
//                                       snapshot.data![i].name,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       );
//                     },
//                     separatorBuilder: (context, index) => const Divider(
//                       thickness: 2,

//                       // height: 15,
//                       color: Color.fromARGB(255, 206, 206, 206),
//                     ),
//                   );
//                 } else {
//                   return Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//    Stream<List<Bookdata>> readBookdata() => FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('lended books')
//       .snapshots()
//       .map((snapshot) =>
//           snapshot.docs.map((doc) => Bookdata.fromJson(doc.data())).toList());

//   Future createUser(User user) async {
//     final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);
//     final json = user.toJson();
//     await docUser.set(json);
//   }
// }

// class User {
//   List<String> contents = [];

//   String id;
//   final String name;
//   final String emailId;
//   // final String lend;

//   User({
//     this.id = '',
//     required this.name,
//     required this.emailId,
//     // required this.lend,
//   });
//   Map<String, dynamic> toJson() => {
//         // 'id': id,
//         'name': name,
//         // 'lend': lend,
//         'email': emailId,
//       };
//   static User fromJson(Map<String, dynamic> json) => User(
//         // id: json['id'],
//         name: json['name'],
//         // lend: json['lend'],
//         emailId: json['email'],
//       );
// }

// List<User> book = [
//   User(
//     name: json.toString(),
//     // id: json.toString(),
//     // lend: json.toString(),
//     emailId: json.toString(),
//   ),
// ];
