// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:srec_library/Utility.dart';

// import 'Fav.dart';
// import 'My_book.dart';
// import 'Profile.dart';

// class Home extends StatefulWidget {
//   // const Home({required Key key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   CollectionReference ref = FirebaseFirestore.instance.collection('Bookdata');
//   String name = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Color.fromARGB(255, 156, 83, 230),
//             title: const Text("Library"),
//             actions: <Widget>[
//               IconButton(
//                   onPressed: () async {
//                     await FirebaseAuth.instance.signOut();
//                   },
//                   icon: Icon(Icons.logout_outlined))
//             ]),
//         body: Stack(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.search), hintText: 'Search...'),
//               onChanged: (val) {
//                 setState(() {
//                   name = val;
//                 });
//               },
//             ),
//             // const Padding(
//             //   padding: EdgeInsets.only(top: 5),
//             //   child: SizedBox(child: buildFloatingSearchBar(context)),
//             // ),
//             Padding(
//                 padding: const EdgeInsets.only(top: 70),
//                 child: StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('Bookdata')
//                       .snapshots(),
//                   builder: (context, snapshots) {
//                     return (snapshots.connectionState ==
//                             ConnectionState.waiting)
//                         ? Center(
//                             child: CircularProgressIndicator(),
//                           )
//                         : ListView.builder(
//                             itemCount: snapshots.data!.docs.length,
//                             itemBuilder: (context, index) {
//                               var data = snapshots.data!.docs[index].data()
//                                   as Map<String, dynamic>;

//                               if (name.isEmpty) {
//                                 return ListTile(
//                                   title: Text(
//                                     data['Book name'],
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                         color: Colors.black54,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   subtitle: Text(
//                                     data['Id'],
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                         color: Colors.black54,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   leading: CircleAvatar(
//                                     backgroundImage:
//                                         NetworkImage(data['Author name']),
//                                   ),
//                                 );
//                               }
//                               if (data['Book name']
//                                   .toString()
//                                   .toLowerCase()
//                                   .startsWith(name.toLowerCase())) {
//                                 return ListTile(
//                                   title: Text(
//                                     data['Book name'],
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                         color: Colors.black54,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   subtitle: Text(
//                                     data['Id'],
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                         color: Colors.black54,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   leading: CircleAvatar(
//                                     backgroundImage:
//                                         NetworkImage(data['Author name']),
//                                   ),
//                                 );
//                               }
//                               return Container();
//                             });
//                   },
//                 )),
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
//             height: 50,
//             child: BottomAppBar(
//               shape: const CircularNotchedRectangle(),
//               notchMargin: 4.0,
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.book_rounded),
//                     color: Color.fromARGB(255, 156, 83, 230),
//                     splashColor: Color.fromARGB(255, 156, 83, 230),
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => My_book()));
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.favorite),
//                     color: Color.fromARGB(255, 156, 83, 230),
//                     splashColor: Color.fromARGB(255, 156, 83, 230),
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Fav()));
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.settings),
//                     splashColor: Color.fromARGB(255, 156, 83, 230),
//                     color: Color.fromARGB(255, 156, 83, 230),
//                     onPressed: () {
//                       // Navigator.push(context,
//                       //     MaterialPageRoute(builder: (context) => Set()));
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.person),
//                     splashColor: Color.fromARGB(255, 156, 83, 230),
//                     color: Color.fromARGB(255, 156, 83, 230),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Profile()));
//                     },
//                   ),
//                 ],
//               ),
//             )));
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
