// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:srec_library/Color.dart';
// import 'package:srec_library/Home.dart';
// import 'package:srec_library/testfinal.dart';
// import 'package:srec_library/testp.dart';
// import 'package:srec_library/testpopz.dart';

// import 'Flushbar.dart';

// class Otp extends StatefulWidget {
//   const Otp({Key? key}) : super(key: key);

//   State<Otp> createState() => _OtpState();
// }

// String OTP = "";

// class _OtpState extends State<Otp> {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         width: double.infinity,
//         height: MediaQuery.of(context).size.height,
//         child: Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             Positioned(
//               top: 0,
//               left: 0,
//               child: SizedBox(
//                 height: 330,
//                 child: Image(
//                   image: AssetImage('images/topsbar.png'),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               child: SizedBox(
//                 height: 130,
//                 child: Image(
//                   image: AssetImage('images/downbar.png'),
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 // Padding(
//                 //   padding: const EdgeInsets.only(top: 0),
//                 //   child: SizedBox(
//                 //     child: Image(
//                 //       image: AssetImage('images/app small.png'),
//                 //     ),
//                 //   ),
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 280,
//                     right: 226,
//                     bottom: 10,
//                   ),
//                   child: Text(
//                     "  Enter the\n  shared OTP",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25,
//                       color: Color.fromARGB(255, 118, 42, 131),
//                     ),
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
//                 //   child: TextField(
//                 //     autocorrect: false,
//                 //     onChanged: (value) {
//                 //       emailId = value;
//                 //     },
//                 //     decoration: InputDecoration(
//                 //         fillColor: Colors.amber,
//                 //         // icon: Icon(Icons.person),
//                 //         border: const OutlineInputBorder(
//                 //           borderRadius: BorderRadius.all(
//                 //             Radius.circular(10.0),
//                 //           ),
//                 //         ),
//                 //         enabledBorder: OutlineInputBorder(
//                 //           borderRadius: BorderRadius.circular(30.0),
//                 //           borderSide:
//                 //               BorderSide(color: Color.fromARGB(255, 118, 42, 131)),
//                 //         ),
//                 //         focusedBorder: OutlineInputBorder(
//                 //           borderRadius: BorderRadius.circular(10.0),
//                 //           borderSide: BorderSide(
//                 //             color: Color.fromARGB(255, 118, 42, 131),
//                 //           ),
//                 //         ),
//                 //         prefixIcon: Icon(Icons.person, color: Colors.purple),
//                 //         labelText: 'Email id',
//                 //         labelStyle: TextStyle(
//                 //           color: Color.fromARGB(255, 118, 42, 131),
//                 //         ),
//                 //         hintText: '  name.roll_no@srec.ac.in'),
//                 //     controller: TextEditingController()..text = emailId,
//                 //   ),
//                 // ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
//                 //   child: TextField(
//                 //     autocorrect: false,
//                 //     obscureText: true,
//                 //     onChanged: (value) {
//                 //       password = value;
//                 //     },
//                 //     decoration: InputDecoration(
//                 //       fillColor: Colors.blue,
//                 //       border: const OutlineInputBorder(
//                 //         borderRadius: BorderRadius.all(
//                 //           Radius.circular(10.0),
//                 //         ),
//                 //       ),
//                 //       enabledBorder: OutlineInputBorder(
//                 //         borderRadius: BorderRadius.circular(30.0),
//                 //         borderSide:
//                 //             BorderSide(color: Color.fromARGB(255, 118, 42, 131)),
//                 //       ),
//                 //       focusedBorder: OutlineInputBorder(
//                 //         borderRadius: BorderRadius.circular(10.0),
//                 //         borderSide: BorderSide(
//                 //           color: Color.fromARGB(255, 118, 42, 131),
//                 //         ),
//                 //       ),
//                 //       prefixIcon: Icon(
//                 //         Icons.lock,
//                 //         color: Colors.purple,
//                 //       ),
//                 //       labelText: 'Password',
//                 //       labelStyle: TextStyle(
//                 //         color: Color.fromARGB(255, 118, 42, 131),
//                 //       ),
//                 //     ),
//                 //     controller: TextEditingController()
//                 //       ..text = password
//                 //       ..selection = TextSelection.collapsed(offset: password.length),
//                 //     inputFormatters: [LengthLimitingTextInputFormatter(8)],
//                 //   ),
//                 // ),

//                 Padding(
//                   padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
//                   child: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     textInputAction: TextInputAction.next,
//                     cursorColor: kPrimaryColor,
//                     autocorrect: false,
//                     obscureText: true,
//                     onChanged: (value) {
//                       OTP = value;
//                     },
//                     decoration: InputDecoration(
//                       hintText: "OTP",
//                       // hintText: '  name.roll_no@srec.ac.in'),
//                       prefixIcon: Padding(
//                         padding: const EdgeInsets.all(defaultPadding),
//                         child: Icon(Icons.numbers),
//                       ),
//                     ),
//                     controller: TextEditingController()
//                       ..text = OTP
//                       ..selection = TextSelection.collapsed(offset: OTP.length),
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(RegExp("[0-9]+")),
//                       LengthLimitingTextInputFormatter(4)
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 50),
//                   child: SizedBox(
//                     height: 50,
//                     width: 120,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
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
//                       onPressed: () {
//                         if (OTP == "") {
//                           Snackbar().showFlushbar(
//                             context: (context),
//                             message: "Enter the  OTP",
//                           );
//                         } else if (OTP.length != 4) {
//                           Snackbar().showFlushbar(
//                             context: (context),
//                             message: "Enter a valid OTP",
//                           );
//                         } else {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => Home()));
//                         }
//                       },
//                       child: Text("Login"),
//                     ),
//                   ),
//                 ),
//                 // Column(
//                 //   crossAxisAlignment: CrossAxisAlignment.end,
//                 //   children: [
//                 //     Padding(
//                 //       padding: const EdgeInsets.only(right: 252, top: 90),
//                 //       child: SizedBox(
//                 //         height: 140,
//                 //         width: 140,
//                 //         child: Image(
//                 //           image: AssetImage('images/croped.png'),
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
