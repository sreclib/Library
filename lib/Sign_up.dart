import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Auth.dart';
import 'Color.dart';
import 'Flushbar.dart';
import 'Home.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
   late double deviceHeight;
  late double deviceWidth;
  final _formKey = GlobalKey<FormState>();
  String name = "";
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
                    fit: BoxFit.fill,
                    image: AssetImage('images/downbar.png'),
                  ),
                ),
              ),
              Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 320, right: 270, bottom: 10),
                  child: Text(
                    "SIGN  UP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 118, 42, 131),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: kPrimaryColor,
                    autocorrect: false,
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      hintText: " Name",

                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.nest_cam_wired_stand)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the name';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        name = value!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
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
                    controller: TextEditingController()..text = emailId,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
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
                      hintText: " New Password",
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
                  padding: const EdgeInsets.only(top: 30, left: 230),
                  child: SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            AuthServices.signupUser(
                                emailId, password, name, context);
                          }
                        },
                        child: Text('Signup')),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
