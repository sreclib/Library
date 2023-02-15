import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srec_library/Color.dart';
import 'package:srec_library/Fpasswrd.dart';
import 'package:srec_library/Home.dart';
import 'package:srec_library/Otp.dart';
import 'package:srec_library/Sign_up.dart';

import 'Flushbar.dart';

class Cpassword extends StatefulWidget {
  const Cpassword({Key? key}) : super(key: key);

  State<Cpassword> createState() => _CpasswordState();
}

String emailId = "";
String OTP = "";
String newpassword = "";
String confirmpassword = "";
final auth = FirebaseAuth.instance;

class _CpasswordState extends State<Cpassword> {
  // late double deviceHeight;
  // late double deviceWidth;
  // String emailId = "";
  // String password = "";

  Widget build(BuildContext context) {
    // deviceWidth = MediaQuery.of(context).size.width;
    // deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                height: 330,
                child: Image(
                  image: AssetImage('images/topsbar.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 130,
                child: Image(
                  image: AssetImage('images/downbar.png'),
                ),
              ),
            ),
            Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(top: 0),
                //   child: SizedBox(
                //     child: Image(
                //       image: AssetImage('images/app small.png'),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 320,
                    right: 235,
                    bottom: 10,
                  ),
                  child: Text(
                    "  Change \n  Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 118, 42, 131),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     top: 0,
                //     right: 225,
                //     bottom: 10,
                //   ),
                //   child: Text(
                //     "  Password",
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 25,
                //       color: Color.fromARGB(255, 118, 42, 131),
                //     ),
                //   ),
                // ),

                // Padding(
                //   padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                //   child: TextField(
                //     autocorrect: false,
                //     onChanged: (value) {
                //       emailId = value;
                //     },
                //     decoration: InputDecoration(
                //         fillColor: Colors.amber,
                //         // icon: Icon(Icons.person),
                //         border: const OutlineInputBorder(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(10.0),
                //           ),
                //         ),
                //         enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30.0),
                //           borderSide:
                //               BorderSide(color: Color.fromARGB(255, 118, 42, 131)),
                //         ),
                //         focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10.0),
                //           borderSide: BorderSide(
                //             color: Color.fromARGB(255, 118, 42, 131),
                //           ),
                //         ),
                //         prefixIcon: Icon(Icons.person, color: Colors.purple),
                //         labelText: 'Email id',
                //         labelStyle: TextStyle(
                //           color: Color.fromARGB(255, 118, 42, 131),
                //         ),
                //         hintText: '  name.roll_no@srec.ac.in'),
                //     controller: TextEditingController()..text = emailId,
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                //   child: TextField(
                //     autocorrect: false,
                //     obscureText: true,
                //     onChanged: (value) {
                //       password = value;
                //     },
                //     decoration: InputDecoration(
                //       fillColor: Colors.blue,
                //       border: const OutlineInputBorder(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(10.0),
                //         ),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30.0),
                //         borderSide:
                //             BorderSide(color: Color.fromARGB(255, 118, 42, 131)),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10.0),
                //         borderSide: BorderSide(
                //           color: Color.fromARGB(255, 118, 42, 131),
                //         ),
                //       ),
                //       prefixIcon: Icon(
                //         Icons.lock,
                //         color: Colors.purple,
                //       ),
                //       labelText: 'Password',
                //       labelStyle: TextStyle(
                //         color: Color.fromARGB(255, 118, 42, 131),
                //       ),
                //     ),
                //     controller: TextEditingController()
                //       ..text = password
                //       ..selection = TextSelection.collapsed(offset: password.length),
                //     inputFormatters: [LengthLimitingTextInputFormatter(8)],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: kPrimaryColor,
                    autocorrect: false,
                    onChanged: (value) {
                      emailId = value;
                    },
                    decoration: InputDecoration(
                      hintText: " Email",
                      // hintText: '  name.roll_no@srec.ac.in'),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.person),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z]+\.[0-9]+@[srec]+\.[ac]+\.[in]')
                              .hasMatch(emailId)) {
                        return 'Please Enter valid Srec Email';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        emailId = value!;
                      });
                    },
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                //   child: TextFormField(
                //     keyboardType: TextInputType.emailAddress,
                //     textInputAction: TextInputAction.next,
                //     cursorColor: kPrimaryColor,
                //     autocorrect: false,
                //     obscureText: true,
                //     onChanged: (value) {
                //       OTP = value;
                //     },
                //     decoration: InputDecoration(
                //       hintText: "OTP",
                //       // hintText: '  name.roll_no@srec.ac.in'),
                //       prefixIcon: Padding(
                //         padding: const EdgeInsets.all(defaultPadding),
                //         child: Icon(Icons.person),
                //       ),
                //     ),
                //     controller: TextEditingController()
                //       ..text = OTP
                //       ..selection = TextSelection.collapsed(offset: OTP.length),
                //     inputFormatters: [
                //       FilteringTextInputFormatter.allow(RegExp("[0-9]+")),
                //       LengthLimitingTextInputFormatter(4)
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    height: 50,
                    width: 120,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 156, 83, 230),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              // side: BorderSide(color: Colors.red),
                            ),
                          )),
                      child: Text('Send Request'),
                      onPressed: () {
                        auth.sendPasswordResetEmail(email: emailId);
                        Navigator.of(context).pop();
                      },
                    ),
                    // onPressed: () async {
                    //   if (emailId == "") {
                    //     Snackbar().showFlushbar(
                    //       context: (context),
                    //       message: "Enter the email id",
                    //     );
                    //   } else if (!RegExp(
                    //           r'^[a-z]+\.[0-9]+@[srec]+\.[ac]+\.[in]')
                    //       .hasMatch(emailId)) {
                    //     Snackbar().showFlushbar(
                    //       context: (context),
                    //       message: "Enter the valid SREC email id",
                    //     );
                    //   } else {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => Otp()));
                    //   }
                    // },
                    // child: Text("Login"),
                    // ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// 