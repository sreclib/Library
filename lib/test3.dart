// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:srec_library/test4.dart';

// class Logi extends StatefulWidget {
//   @override
//   _LogiState createState() => _LogiState();
// }

// class _LogiState extends State<Logi> {
//   late String emailId;
//   late String password;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: Text('Login Form'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.email_outlined),
//                 hintText: 'Your Email',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(22.0)),
//               ),
//               onChanged: (value) => setState(() {
//                 emailId = value;
//               }),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.lock_outline),
//                   hintText: 'Password',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(22.0))),
//               onChanged: (value) => setState(() {
//                 password = value;
//               }),
//             ),
//             SizedBox(
//               height: 150,
//             ),
//             MaterialButton(
//                 padding: EdgeInsets.symmetric(vertical: 18, horizontal: 72),
//                 color: Colors.deepPurple,
//                 textColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: new BorderRadius.circular(32.0)),
//                 onPressed: () {
//                   FirebaseAuth.instance
//                       .signInWithEmailAndPassword(
//                           email: emailId, password: password)
//                       .then((user) => Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Hom())))
//                       .catchError((e) {
//                     print(e);
//                   });
//                 },
//                 child: Text(
//                   'LOGIN',
//                   style: TextStyle(fontSize: 18.0),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
