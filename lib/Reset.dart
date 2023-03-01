// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ResetScreen extends StatefulWidget {
//   @override
//   _ResetScreenState createState() => _ResetScreenState();
// }

// class _ResetScreenState extends State<ResetScreen> {
//   String emailId = "";
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Reset Password'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(hintText: 'Email'),
//               onChanged: (value) {
//                 setState(() {
//                   emailId = value.trim();
//                 });
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton(
//                   style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(
//                             Color.fromARGB(255, 156, 83, 230),
//                           ),
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(25.0),
//                               // side: BorderSide(color: Colors.red),
//                             ),
//                           )),
//                 child: Text('Send Request'),
//                 onPressed: () {
//                   auth.sendPasswordResetEmail(email: emailId);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
