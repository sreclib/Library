// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../main.dart';
// import 'register.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late SharedPreferences pref;
//   User? user = null;

//   @override

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       appBar: AppBar(
      
//       ),
//       body: user != null
//           ? Center(
//               child: Column(
//               children: [
//                 Text("Username : ${user!.username}"),
//                 SizedBox(
//                   height: 16,
//                 ),
//               ],
//             ))
//           : SizedBox(),
//     );
//   }
// }
