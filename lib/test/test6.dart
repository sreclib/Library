// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:srec_library/Fav.dart';
// import 'package:srec_library/Utility.dart';

// import '../My_book.dart';
// import '../Profile.dart';


// class Home extends StatefulWidget {
//   // const Home({required Key key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   CollectionReference ref = FirebaseFirestore.instance.collection('Bookdata');
//   String book = '';
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         appBar: AppBar(
//            automaticallyImplyLeading: false,
//             backgroundColor: Color.fromARGB(255, 156, 83, 230),
//             title: const Text("Library"),
//             // actions: <Widget>[
//             //   IconButton(
//             //       onPressed: () async {
//             //         await FirebaseAuth.instance.signOut();
//             //       },
//             //       icon: Icon(Icons.logout_outlined))
//             // ]
//             )
//             ,
//         body: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 570),
//               child: Center(
//                 child: SizedBox(height: 50,width: 370,
//                   child: TextField(
//                     cursorColor: Color.fromARGB(255, 156, 83, 230),
//                     decoration: InputDecoration(
//                       focusColor: Color.fromARGB(255, 156, 83, 230),
//                       suffixIcon: Icon(Icons.search),
//                       hintText: 'Search...',
//                       hoverColor: Color.fromARGB(255, 118, 42, 131),
//                       iconColor: Color.fromARGB(255, 118, 42, 131),
//                     ),
//                     onChanged: (val) {
//                       setState(() {
//                         book = val;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 70),
//               child: StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('Bookdata')
//                     .snapshots(),
//                 builder: (context, snapshots) {
//                   return (snapshots.connectionState == ConnectionState.waiting)
//                       ? Center(
//                           child: CircularProgressIndicator(),
//                         )
//                       : ListView.separated(
//                           itemCount: snapshots.data!.docs.length,
//                           itemBuilder: (context, index) {
//                             var data = snapshots.data!.docs[index].data()
//                                 as Map<String, dynamic>;

//                             if (book.isEmpty) {
//                               return ExpansionTile(
//                                 textColor: Color.fromARGB(255, 156, 83, 230),
//                                 trailing: IconButton(
//                                   color: Color.fromARGB(255, 156, 83, 230),
//                                   icon: (data['like'] == true)
//                                       ? Icon(Icons.favorite)
//                                       : Icon(Icons.favorite_outline_outlined),
//                                   onPressed: () => {
//                                     // for favourite and un-favourite
//                                     if (data['like'] == true)
//                                       {
//                                         FirebaseFirestore.instance
//                                             .collection('users')
//                                             .doc(FirebaseAuth
//                                                 .instance.currentUser!.uid)
//                                             .collection('fav')
//                                             .doc()
//                                             .update({'like': false})
//                                       }
//                                     else
//                                       {
//                                         FirebaseFirestore.instance
//                                             .collection('users')
//                                             .doc(FirebaseAuth
//                                                 .instance.currentUser!.uid)
//                                             .collection('fav')
//                                             .doc()
//                                             .update({'like': true})
//                                       }
//                                   },
                                  
//                                 ),
//                                 iconColor: Color.fromARGB(255, 79, 18, 80),
//                                 title: Text(
//                                   data['Book name'],
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 children: <Widget>[
//                                   Wrap(
//                                     textDirection: TextDirection.ltr,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Book ID: ${data['Id']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Author name: ${data['Author name']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Publisher name:  ${data['Publisher']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Edition:  ${data['Edition']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               );
//                             }
//                             if (data['Book name']
//                                 .toString()
//                                 .toLowerCase()
//                                 .startsWith(book.toLowerCase())) {
//                               return ExpansionTile(
//                                 textColor: Color.fromARGB(255, 156, 83, 230),
//                                 trailing: IconButton(
//                                   color: Color.fromARGB(255, 156, 83, 230),
//                                   icon: (data['like'] == true)
//                                       ? Icon(Icons.favorite)
//                                       : Icon(Icons.favorite_outline_outlined),
//                                   onPressed: () => {
//                                     // for favourite and un-favourite
//                                     if (data['like'] == true)
//                                       {
//                                         FirebaseFirestore.instance
//                                             .collection('users')
//                                             .doc(FirebaseAuth
//                                                 .instance.currentUser!.uid)
//                                             .collection('fav')
//                                             .doc(data['Book name'])
//                                             .update({'like': false})
//                                       }
//                                     else
//                                       {
//                                         FirebaseFirestore.instance
//                                             .collection('template')
//                                             .doc(FirebaseAuth
//                                                 .instance.currentUser!.uid)
//                                             .collection('fav')
//                                             .doc(data['Book name'])
//                                             .update({'like': true})
//                                       }
//                                   },
//                                   // onPressed: () => setState(
//                                   //     () => _isFavorited[i] = !_isFavorited[i],),
//                                   //   icon: _isFavorited[i]
//                                   //       ? Icon(Icons.favorite)
//                                   //       : Icon(Icons.favorite_border),
//                                 ),
//                                 iconColor: Color.fromARGB(255, 79, 18, 80),
//                                 title: Text(
//                                   data['Book name'],
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 children: <Widget>[
//                                   Wrap(
//                                     textDirection: TextDirection.ltr,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Book ID: ${data['Id']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Author name: ${data['Author name']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Publisher name: ${data['Publisher']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Edition:  ${data['Edition']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               );
//                             }
//                             return Container();
//                           },
//                           separatorBuilder: (context, index) => const Divider(
//                                 thickness: 1,

//                                 // height: 15,
//                                 color: Color.fromARGB(255, 206, 206, 206),
//                               ));
//                 },
//               ),
//             ),
//           ],
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Color.fromARGB(255, 156, 83, 230),
//           child: const Icon(Icons.home),
//           onPressed: () {
//             Navigator.of(context).push(_createRoute());
//           },
//         ),
//         bottomNavigationBar: SizedBox(
//           height: 50,
//           child: BottomAppBar(
//             shape: const CircularNotchedRectangle(),
//             notchMargin: 4.0,
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.book_rounded),
//                   color: Color.fromARGB(255, 156, 83, 230),
//                   splashColor: Color.fromARGB(255, 156, 83, 230),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => My_book()));
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.favorite),
//                   color: Color.fromARGB(255, 156, 83, 230),
//                   splashColor: Color.fromARGB(255, 156, 83, 230),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Fav()));
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.settings),
//                   splashColor: Color.fromARGB(255, 156, 83, 230),
//                   color: Color.fromARGB(255, 156, 83, 230),
//                   onPressed: () {
//                     // Navigator.push(context,
//                     //     MaterialPageRoute(builder: (context) => Set()));
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.person),
//                   splashColor: Color.fromARGB(255, 156, 83, 230),
//                   color: Color.fromARGB(255, 156, 83, 230),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const Profile()));
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Route _createRoute() {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => Home(),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(0, 0.8);

//         const end = Offset.zero;
//         const curve = Curves.fastLinearToSlowEaseIn;

//         var tween =
//             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//         return SlideTransition(
//           position: animation.drive(tween),
//           child: child,
//         );
//       },
//     );
//   }
// }
