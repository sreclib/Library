import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:srec_library/Admin_lend.dart';
import 'package:srec_library/Admin_upload.dart';
import 'package:srec_library/Login.dart';
import 'package:srec_library/test4.dart';
import 'package:srec_library/testfinal.dart';
import 'package:srec_library/testp.dart';
import 'package:srec_library/testpopz.dart';
import 'Ad_books.dart';
import 'Home.dart';

class Admin_login extends StatefulWidget {
  const Admin_login({Key? key}) : super(key: key);

  State<Admin_login> createState() => _Admin_loginState();
}

class _Admin_loginState extends State<Admin_login> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 114, 49, 158),
            title: Text("Library"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }),
            ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 100, right: 100),
              child: SizedBox(
                height: 70,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 178, 122, 250),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70.0),
                          // side: BorderSide(color: Colors.red),
                        ),
                      )),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ad_books()));
                  },
                  child: Text(
                    "BOOKS  TAKEN",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 100, right: 100),
              child: SizedBox(
                height: 70,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 178, 122, 250),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70.0),
                          // side: BorderSide(color: Colors.red),
                        ),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Admin_upload()));
                  },
                  child: Text(
                    "UPLOAD  BOOK",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 100, right: 100),
              child: SizedBox(
                height: 70,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 178, 122, 250),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70.0),
                          // side: BorderSide(color: Colors.red),
                        ),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Admin_lend()));
                  },
                  child: Text(
                    "LEND",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
