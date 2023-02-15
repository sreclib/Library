// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:srec_library/My_book.dart';
// import 'package:srec_library/Profile.dart';
// import 'package:srec_library/Settings.dart';
// import 'Fav.dart';
// import 'Utility.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final List<bool> _isFavorited = List.filled(book.length, false);
//   final controllerBookName = TextEditingController();
//   final controllerBookId = TextEditingController();
//   final controllerAuthorName = TextEditingController();
//   final controllerPublisherName = TextEditingController();
//   final controllerEdition = TextEditingController();

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
//             padding: EdgeInsets.only(top: 5),
//             child: SizedBox(child: buildFloatingSearchBar(context)),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 70),
//             child: StreamBuilder<List<User>>(
//               stream: readUser(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return Text('Something went wrong! ${snapshot.error}');
//                 } else if (snapshot.hasData) {
//                   final Bookdata = snapshot.data!;

//                   return ListView.separated(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     physics: BouncingScrollPhysics(),
//                     itemCount: User.length,
//                     itemBuilder: (context, i) {
//                       return ExpansionTile(
//                         textColor: Colors.black,
//                         // textColor: Color.fromARGB(255, 156, 83, 230),

//                         trailing: IconButton(
//                           color: Color.fromARGB(255, 156, 83, 230),
//                           onPressed: () => setState(() => {
//                                 print(FirebaseAuth.instance.currentUser!.uid),
//                                 // FirebaseFirestore.instance
//                                 //     .collection('users')
//                                 //     .doc(FirebaseAuth.instance.currentUser!.uid)
//                                 //     .collection('favoiurites')
//                                 //     .doc(snapshot.data![i].bookId)
//                                 //     .set({
//                                 //   'Author name': snapshot.data![i].authorName
//                                 // }),
//                                 print(i),
//                                 _isFavorited[i] = !_isFavorited[i]
//                               }),
//                           icon: _isFavorited[i]
//                               ? Icon(Icons.favorite)
//                               : Icon(Icons.favorite_border),
//                         ),

//                         iconColor: Color.fromARGB(255, 79, 18, 80),

//                         title: Text(
//                           snapshot.data![i].bookId,
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
//                                   'Author Name : ' + snapshot.data![i].bookId,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                 child: Text(
//                                   ', Book Id : ' + snapshot.data![i].bookId,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 child: Text(
//                                   ', Edition : ' + snapshot.data![i].bookId,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 child: Text(
//                                   ', Publisher Name : ' +
//                                       snapshot.data![i].bookId,
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
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Color.fromARGB(255, 156, 83, 230),
//         child: const Icon(Icons.shopping_cart_outlined),
//         onPressed: () {
//           Navigator.of(context).push(_createRoute());
//         },
//       ),
//       bottomNavigationBar: SizedBox(
//         height: 50,
//         child: BottomAppBar(
//           shape: const CircularNotchedRectangle(),
//           notchMargin: 4.0,
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.book_rounded),
//                 color: Color.fromARGB(255, 156, 83, 230),
//                 splashColor: Color.fromARGB(255, 156, 83, 230),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => My_book()));
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.favorite),
//                 color: Color.fromARGB(255, 156, 83, 230),
//                 splashColor: Color.fromARGB(255, 156, 83, 230),
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => Fav()));
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.settings),
//                 splashColor: Color.fromARGB(255, 156, 83, 230),
//                 color: Color.fromARGB(255, 156, 83, 230),
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => Set()));
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.person),
//                 splashColor: Color.fromARGB(255, 156, 83, 230),
//                 color: Color.fromARGB(255, 156, 83, 230),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => const Profile()));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Stream<List<Bookdata>> readBookdata() => FirebaseFirestore.instance
//   //     .collection('Bookdata')
//   //     .snapshots()
//   //     .map((snapshot) =>
//   //         snapshot.docs.map((doc) => Bookdata.fromJson(doc.data())).toList());

//   Stream<List<User>> readUser() => FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('lended books')
//       .snapshots()
//       .map((snapshot) =>
//           snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

//   Future createUser(User user) async {
//     final docUser = FirebaseFirestore.instance.collection('users').doc();
//     final json = user.toJson();
//     await docUser.set(json);
//   }
// }

// class User {
//   final String bookId;

//   static var length;

//   User({
//     required this.bookId,
//   });
//   Map<String, dynamic> toJson() => {
//         'Book id': bookId,
//       };
//   static User fromJson(Map<String, dynamic> json) => User(
//         bookId: json['Book id'],
//       );
// }

// List<User> book = [
//   User(
//     bookId: json.toString(),
//   ),
//   User(
//     bookId: json.toString(),
//   ),
//   User(
//     bookId: json.toString(),
//   ),
// ];
// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => const Cart(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0, 0.8);

//       const end = Offset.zero;
//       const curve = Curves.fastLinearToSlowEaseIn;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

// class Cart extends StatelessWidget {
//   const Cart({Key? key}) : super(key: key);

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 156, 83, 230),
//         title: Text('CART'),
//       ),
//     );
//   }
// }
