// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:srec_library/sp/widge.dart';

// import 'homeScreen.dart';
// import 'loginScreen.dart';

// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({Key? key}) : super(key: key);

//   @override
//   State<RegistrationScreen> createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   TextEditingController nameController = TextEditingController();


//   late SharedPreferences pref;

//   @override
//   void initState() {
//     initPreferences();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       appBar: AppBar(title: const Text("Registration")),
//       body: Container(
//         margin: const EdgeInsets.all(16),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 customTextField(nameController, "Username"),
                
//                 ElevatedButton(
//                   onPressed: registerUser,
//                   child: const Text(
//                     "Register",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
               
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void registerUser() async {
//     final User user = User(
//         userId: DateTime.now().millisecondsSinceEpoch.toString(),
//         username: nameController.text,
      
//         );

//     String jsonString = jsonEncode(user);
//     pref.setString("userData", jsonString);
//     pref.setBool("isLogin", true);

//     Navigator.pushReplacement(context,
//         MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
//   }

//   void initPreferences() async {
//     pref = await SharedPreferences.getInstance();
//   }
// }
// class User {
//   late String userId;
//   late String username;


//   User(
//       {required this.userId,
//       required this.username,
    
//       });

//   User.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     username = json['username'];

//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['username'] = this.username;

//     return data;
//   }
// }