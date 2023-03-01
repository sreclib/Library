// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:srec_library/My_book.dart';
// import 'package:srec_library/Profile.dart';
// import 'Fav.dart';
// import 'Settings.dart';
// import 'Utility.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<bool> _isFavorited = List.filled(books.length, false);

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
//             // IconButton(
//             //     icon: Icon(
//             //       Icons.login,
//             //       color: Colors.white,
//             //     ),
//             //     onPressed: () {
//             //       // Navigator.push(
//             //       //     context, MaterialPageRoute(builder: (context) => Home()));
//             //     }),
//           ]),
//       body: Stack(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 5),
//             child: SizedBox(child: buildFloatingSearchBar(context)),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 60),
//             child: Container(
//               child: ListView.separated(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,   
//                 physics: BouncingScrollPhysics(),
//                 itemCount: books.length,
//                 itemBuilder: (context, i) {
//                   return ExpansionTile(
//                     textColor: Colors.black,
//                     // textColor: Color.fromARGB(255, 156, 83, 230),

//                     trailing: IconButton(
//                       color: Color.fromARGB(255, 156, 83, 230),
//                       onPressed: () =>
//                           setState(() => _isFavorited[i] = !_isFavorited[i]),
//                       icon: _isFavorited[i]
//                           ? Icon(Icons.favorite)
//                           : Icon(Icons.favorite_border),
//                     ),
//                     title: Text(
//                       books[i].title,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.normal,
//                           fontStyle: FontStyle.normal),
//                     ),
//                     // iconColor: Color.fromARGB(255, 79, 18, 80),
//                     children: <Widget>[
//                       Column(
//                         children: _buildExpandableContent(books[i]),
//                       ),
//                     ],
//                   );
//                 },
//                 separatorBuilder: (context, index) => const Divider(
//                   thickness: 2,

//                   // height: 15,
//                   color: Color.fromARGB(255, 206, 206, 206),
//                 ),
//               ),
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
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(builder: (context) => Settings()));
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

//   _buildExpandableContent(Books books) {
//     List<Widget> columnContent = [];

//     List<IconData> icons = [Icons.favorite];

//     for (String content in books.contents)
//       columnContent.add(
//         ListTile(
          
//           title: Text(
//             content,
//             style: TextStyle(fontSize: 15.0),
//           ),
//           trailing: Icon(
//             Icons.card_travel,
//             color: Color.fromARGB(255, 156, 83, 230),
//           ),
//         ),
//       );

//     return columnContent;
//   }
// }

// class Books {
//   final String title;
//   List<String> contents = [];
//   final IconData icon;

//   Books(
//     this.title,
//     this.contents,
//     this.icon,
//   );
// }

// List<Books> books = [
//   Books(
//     'POPZ',
//     ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//     Icons.card_travel,
//   ),
//   // Books(
//   //   'Harry Potter',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Fifa 18',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Wanderlust',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'WWE 2k12',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Superman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Batman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Superman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Batman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Superman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Batman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Superman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Batman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Superman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Batman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Superman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
//   // Books(
//   //   'Batman',
//   //   ['Author:popz,Publisher:popz,Edition:1,Book ID: 123,Year:1960'],
//   //   Icons.card_travel,
//   // ),
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
