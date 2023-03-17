import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Login.dart';
import 'Student_login.dart';
import 'Ad_books.dart';
import 'Admin_lend.dart';
import 'Admin_upload.dart';


class Admin_home extends StatefulWidget {
  const Admin_home({Key? key}) : super(key: key);

  State<Admin_home> createState() => _Admin_homeState();
}

class _Admin_homeState extends State<Admin_home> {
   late double deviceHeight;
  late double deviceWidth;
  Widget build(BuildContext context) {
       deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
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
