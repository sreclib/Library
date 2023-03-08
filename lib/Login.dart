import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srec_library/Admin_home.dart';
import 'package:srec_library/Staff_Login.dart';
import 'package:srec_library/Student_login.dart';

import 'Admin_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Stack(
        children: [
          // SizedBox(
          //   child: Image(
          //     height: 800,
          //     fit: BoxFit.fill,
          //     image: AssetImage('images/flop.png'),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: SizedBox(
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('images/reading.png'),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 50, ),
                    child: Text(
                      "L ibrary",
                      style: TextStyle(
                        fontFamily: 'Signatrue',
                        color: Color.fromARGB(255, 118, 42, 131),
                        fontSize: 60
                      ),
                    )),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 500,
                  ),
                  child: SizedBox(
                    height: 70,
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 227, 206, 255),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70.0),
                              // side: BorderSide(color: Colors.red),
                            ),
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Student_login()));
                      },
                      child: Text(
                        "Student Login",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 118, 42, 131),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: SizedBox(
                    height: 70,
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 227, 206, 255),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70.0),
                              // side: BorderSide(color: Colors.red),
                            ),
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Staff_login()));
                      },
                      child: Text(
                        "Staff Login",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 118, 42, 131),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: SizedBox(
                    height: 70,
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 227, 206, 255),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70.0),
                              // side: BorderSide(color: Colors.red),
                            ),
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Admin_login()));
                      },
                      child: Text(
                        "Admin Login",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 118, 42, 131),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
