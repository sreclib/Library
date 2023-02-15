// import 'package:flutter/material.dart';
// import 'package:srec_library/sp/register.dart';
// import 'package:srec_library/sp/widge.dart';


// import 'homeScreen.dart';

// class LogiScreen extends StatefulWidget {
//   const LogiScreen({Key? key}) : super(key: key);

//   @override
//   State<LogiScreen> createState() => _LogiScreenState();
// }

// class _LogiScreenState extends State<LogiScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       appBar: AppBar(title: const Text("Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             customTextField(emailController, "Email"),
//             customPasswordTextField(passwordController, "Password"),
//             ElevatedButton(
//               onPressed: loginUser,
//               child: const Text(
//                 "Login",
//                 style: const TextStyle(fontSize: 18),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Don't have an account?"),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (BuildContext context) =>
//                                   RegistrationScreen()));
//                     },
//                     child: const Text("Register"))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void loginUser() async {

//     Navigator.pushReplacement(context,
//         MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
//   }
// }