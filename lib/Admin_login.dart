import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srec_library/Admin_home.dart';
import 'package:srec_library/Color.dart';
import 'package:srec_library/Fpasswrd.dart';
import 'package:srec_library/Home.dart';
import 'package:srec_library/Reset.dart';
import 'package:srec_library/Sign_up.dart';

import 'Admin_login.dart';
import 'Auth.dart';
import 'Flushbar.dart';

class Admin_login extends StatefulWidget {
  const Admin_login({Key? key}) : super(key: key);

  State<Admin_login> createState() => _Admin_loginstate();
}

class _Admin_loginstate extends State<Admin_login> {
  final _formKey = GlobalKey<FormState>();

  late double deviceHeight;
  late double deviceWidth;
  String emailId = "";
  String password = "";
  bool login = false;

  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 330,
                  child: Image(
                    fit: BoxFit.fill,
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
                    fit: BoxFit.fitWidth,
                    image: AssetImage('images/downbar.png'),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 320, right: 280, bottom: 10),
                    child: Text(
                      "LOGIN",
                      style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 118, 42, 131),
                  ),)
                    ),
                  ),
          
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      cursorColor: kPrimaryColor,
                      autocorrect: false,
                      onChanged: (value) {
                        emailId = value;
                      },
                      decoration: const InputDecoration(
                        hintText: " Email",
                        // hintText: '  name.roll_no@srec.ac.in'),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.person),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Email ID';
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      cursorColor: kPrimaryColor,
                      autocorrect: false,
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        // hintText: '  name.roll_no@srec.ac.in'),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.lock),
                        ),
                      ),
                      controller: TextEditingController()
                        ..text = password
                        ..selection =
                            TextSelection.collapsed(offset: password.length),
                      // inputFormatters: [LengthLimitingTextInputFormatter(8)],
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Please Enter Password of min length 6';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 156, 83, 230),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  // side: BorderSide(color: Colors.red),
                                ),
                              )),
                          onPressed: () async {
                            if (emailId == "") {
                              Snackbar().showFlushbar(
                                context: (context),
                                message: "Enter the email id",
                              );
                            } else if (password == "") {
                              Snackbar().showFlushbar(
                                context: (context),
                                message: "Enter the password",
                              );
                            } else if (emailId == "admin.123@srec.ac.in" &&
                                password == "1234567890") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Admin_home()));
                            } else {
                              Snackbar().showFlushbar(
                                context: (context),
                                message: "Something went wrong",
                              );
                            }
                          },
                          child: Text('Login')),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
