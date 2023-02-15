import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:srec_library/About_us.dart';
import 'package:srec_library/Fpasswrd.dart';
import 'package:srec_library/Profile.dart';
import 'package:srec_library/Reset.dart';

class Set extends StatefulWidget {
  const Set({Key? key}) : super(key: key);

  State<Set> createState() => _SetState();
}

class _SetState extends State<Set> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 156, 83, 230),
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          ListTile(

            title: Text("Change Password"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Fpassword()));
            },
          ),
          ListTile(
            title: Text("Settings"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About_us()));
            },
          ),
          ListTile(
            title: Text("Change Password"),
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Re)));
            },
          )
        ],
      ),
    );
  }
}
