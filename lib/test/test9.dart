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

//   CollectionReference ref = FirebaseFirestore.instance.collection('BookData');

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
//               padding: const EdgeInsets.only(top: 70),
//               child: StreamBuilder(
//                   stream: ref.snapshots(),
//                   builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData) {
//                       return Center(child: CircularProgressIndicator());
//                     } else {
//                       return ListView.builder(
//                           shrinkWrap: true,
//                           physics: const BouncingScrollPhysics(),
//                           itemCount: snapshot.data?.docs.length,
//                           itemBuilder: (context, index) {
//                             dynamic doc = snapshot.data?.docs[index].data();
//                             Text(
//                               doc[''],
//                             );
//                           });
//                     }
//                   })),
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

//   Stream<List<Bookdata>> readBookdata() => FirebaseFirestore.instance
//       .collection('Bookdata')
//       .snapshots()
//       .map((snapshot) =>
//           snapshot.docs.map((doc) => Bookdata.fromJson(doc.data())).toList());

//   Future createBookdata(Bookdata book) async {
//     final docBookdata = FirebaseFirestore.instance.collection('Bookdata').doc();
//     final json = book.toJson();
//     await docBookdata.set(json);
//   }
// }

// class Bookdata {
//   List<String> contents = [];

//   // final String id;
//   final String bookId;
//   final String bookName;
//   final String authorName;
//   // final String publisher;
//   final String edition;

//   Bookdata({
//     // this.id = '',
//     required this.bookId,
//     required this.bookName,
//     required this.authorName,
//     // required this.publisher,
//     required this.edition,
//   });

//   Map<String, dynamic> toJson() => {
//         // 'id': id,
//         'Id': bookId,
//         'Book name': bookName,
//         'Author name': authorName,
//         // 'Publisher': publisher,
//         'Edition': edition,
//       };
//   static Bookdata fromJson(Map<String, dynamic> json) => Bookdata(
//         // id: json['id'],
//         bookId: json['Id'],
//         bookName: json['Book name'],
//         authorName: json['Author name'],
//         edition: json['Edition'],
//         // publisher: json['Publisher'],
//       );
// }

// List<Bookdata> book = [
//   Bookdata(
//     bookName: json.toString(),
//     authorName: json.toString(),
//     edition: json.toString(),
//     // publisher: json.toString(),
//     bookId: json.toString(),
//   ),
//   Bookdata(
//     bookName: json.toString(),
//     authorName: json.toString(),
//     edition: json.toString(),
//     // publisher: json.toString(),
//     bookId: json.toString(),
//   ),
//   Bookdata(
//     bookName: json.toString(),
//     authorName: json.toString(),
//     edition: json.toString(),
//     // publisher: json.toString(),
//     bookId: json.toString(),
//   ),
//   Bookdata(
//     bookName: json.toString(),
//     authorName: json.toString(),
//     edition: json.toString(),
//     // publisher: json.toString(),
//     bookId: json.toString(),
//   ),
//   Bookdata(
//     bookName: json.toString(),
//     authorName: json.toString(),
//     edition: json.toString(),
//     // publisher: json.toString(),
//     bookId: json.toString(),
//   ),
//   Bookdata(
//     bookName: json.toString(),
//     authorName: json.toString(),
//     edition: json.toString(),
//     // publisher: json.toString(),
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
