import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srec_library/Color.dart';
import 'package:srec_library/Fpasswrd.dart';
import 'package:srec_library/Sign_up.dart';

import 'Auth.dart';

class Staff_login extends StatefulWidget {
  const Staff_login({Key? key}) : super(key: key);

  State<Staff_login> createState() => _Staff_loginstate();
}

class _Staff_loginstate extends State<Staff_login> {
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
                    child: Text("LOGIN",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 118, 42, 131),
                          ),
                        )),
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
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              AuthServices.signinUser(
                                  emailId, password, context);
                           
                            }
                          },
                          child: Text('Login')),
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
                      //   } else if (password == "") {
                      //     Snackbar().showFlushbar(
                      //       context: (context),
                      //       message: "Enter the password",
                      //     );
                      //   } else if (password.length != 8) {
                      //     Snackbar().showFlushbar(
                      //       context: (context),
                      //       message: "Enter a valid password",
                      //     );
                      // } else if (emailId == "admin.123@srec.ac.in") {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => Admin_login()));
                      // } else if (password == "12345678") {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => Admin_login()));
                      //   } else {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) => Home()));
                      //   }
                      // },
                      // child: Text("Login"),
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 100, top: 20, bottom: 0),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Fpassword()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 0, right: 0, left: 0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Sign_up()));
                          },
                          child: Text(
                            "Sign Up?",
                            style: TextStyle(color: Color(0xFF9C27B0)),
                          ),
                        ),
                      ),
                    ],
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
