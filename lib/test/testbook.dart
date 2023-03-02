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
//             child: StreamBuilder<List<Book>>(
//               stream: readBook(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return Text('Something went wrong! ${snapshot.error}');
//                 } else if (snapshot.hasData) {
//                   final Book = snapshot.data!;

//                   return ListView.separated(
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     physics: BouncingScrollPhysics(),
//                     itemCount: Book.length,
//                     itemBuilder: (context, i) {
//                       return ExpansionTile(
//                         textColor: Colors.black,
//                         // textColor: Color.fromARGB(255, 156, 83, 230),

//                         trailing: IconButton(
//                           color: Color.fromARGB(255, 156, 83, 230),
//                           onPressed: () => setState(
//                               () => _isFavorited[i] = !_isFavorited[i]),
//                           icon: _isFavorited[i]
//                               ? Icon(Icons.favorite)
//                               : Icon(Icons.favorite_border),
//                         ),

//                         iconColor: Color.fromARGB(255, 79, 18, 80),

//                         title: Text(
//                           snapshot.data![i].bookName,
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         children: <Widget>[
//                           Wrap(children: [
//                             Text(
//                               'Author Name : ' + snapshot.data![i].authorName,
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                             Text(
//                               ', Edition : ' + snapshot.data![i].edition,
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                             Text(
//                               ', Publisher Name : ' +
//                                   snapshot.data![i].publisherName,
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ]),
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
//                       MaterialPageRoute(builder: (context) => Profile()));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Stream<List<Book>> readBook() => FirebaseFirestore.instance
//       .collection('Book')
//       .snapshots()
//       .map((snapshot) =>
//           snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

//   Future createBook(Book book) async {
//     final docBook = FirebaseFirestore.instance.collection('Book').doc();
//     final json = book.toJson();
//     await docBook.set(json);
//   }
// }

// class Book {
//   List<String> contents = [];

//   // final String id;
//   // final String bookId;
//   final String bookName;
//   final String authorName;
//   final String publisherName;
//   final String edition;

//   static var length;

//   Book({
//     // this.id = '',
//     // required this.bookId,
//     required this.bookName,
//     required this.authorName,
//     required this.publisherName,
//     required this.edition,
//   });
//   Map<String, dynamic> toJson() => {
//         // 'id': id,
//         // 'Book ID': bookId,
//         'Book Name': bookName,
//         'Author Name': authorName,
//         'Publisher Name': publisherName,
//         'Edition': edition,
//       };
//   static Book fromJson(Map<String, dynamic> json) => Book(
//         // id: json['id'],
//         // bookId: json['Book ID'],
//         bookName: json['Book Name'],
//         authorName: json['Author Name'],
//         edition: json['Edition'],
//         publisherName: json['Publisher Name'],
//       );
// }

// List<Book> book = [
//   Book(
//     bookName: json.toString(),
//     authorName: json.toString(),
//     edition: json.toString(),
//     publisherName: json.toString(),
//     // bookId: json.toString(),
//   ),
//   Book(
//     bookName: json.toString(),
//     authorName: json.toString(),
//     edition: json.toString(),
//     publisherName: json.toString(),
//     // bookId: json.toString(),
//   ),
//   Book(
//     bookName: json.toString(),
//     authorName: json.toString(),
//     edition: json.toString(),
//     publisherName: json.toString(),
//     // bookId: json.toString(),
//   ),
//   Book(
//     bookName: json.toString(),
//     authorName: json.toString(),
//     edition: json.toString(),
//     publisherName: json.toString(),
//     // bookId: json.toString(),
//   ),
// ];

//   Route _createRoute() {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => const Cart(),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(0, 0.8);

//         const end = Offset.zero;
//         const curve = Curves.fastLinearToSlowEaseIn;

//         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//         return SlideTransition(
//           position: animation.drive(tween),
//           child: child,
//         );
//       },
//     );
//   }

//   class Cart extends StatelessWidget {
//     const Cart({Key? key}) : super(key: key);

//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 156, 83, 230),
//           title: Text('CART'),
//         ),
//       );
//     }
//   }
