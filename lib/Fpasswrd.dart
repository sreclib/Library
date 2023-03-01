import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srec_library/Color.dart';
import 'package:srec_library/Fpasswrd.dart';
import 'package:srec_library/Home.dart';
import 'package:srec_library/Sign_up.dart';

import 'Flushbar.dart';

class Fpassword extends StatefulWidget {
  const Fpassword({Key? key}) : super(key: key);

  State<Fpassword> createState() => _FpasswordState();
}

String emailId = "";

final auth = FirebaseAuth.instance;

class _FpasswordState extends State<Fpassword> {
  late double deviceHeight;
  late double deviceWidth;
  // String emailId = "";
  // String password = "";

  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

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
              right: 0,
              child: SizedBox(
                height: 330,
                child: Image(                    fit: BoxFit.fill,

                  image: AssetImage('images/topsbar.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 130,
                child: Image(                    fit: BoxFit.fill,

                  image: AssetImage('images/downbar.png'),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 320,
                    right: 235,
                    bottom: 10,
                  ),
                  child: Text(
                    "  Reset\n  Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 118, 42, 131),
                    ),
                  ),
                ),
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
