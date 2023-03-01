import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:srec_library/Color.dart';

class Admin_lend extends StatefulWidget {
  const Admin_lend({super.key});

  @override
  State<Admin_lend> createState() => _Admin_lendState();
}

class _Admin_lendState extends State<Admin_lend> {
  final controllerName = TextEditingController();
  final controlleremailId = TextEditingController();
  final controllerBookName = TextEditingController();
  final controllerRollNum = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerExpire = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 156, 83, 230),
        title: Text("Library"),
        // actions: <Widget>[
        //   IconButton(
        //       onPressed: () async {
        //         await FirebaseAuth.instance.signOut();
        //       },
        //       icon: Icon(Icons.logout_outlined))
        // IconButton(
        //     icon: Icon(
        //       Icons.login,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       // Navigator.push(
        //       //     context, MaterialPageRoute(builder: (context) => Home()));
        //     }),
        // ]
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
          child: TextFormField(
            controller: controllerName,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: " Name",
              // hintText: '  name.roll_no@srec.ac.in'),
              prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(
                    Icons.book_outlined,
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: TextFormField(
            controller: controllerName,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: " Email Id",
              // hintText: '  name.roll_no@srec.ac.in'),
              prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(
                    Icons.book_outlined,
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: TextFormField(
            controller: controllerBookName,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: " Book Name",
              // hintText: '  name.roll_no@srec.ac.in'),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person_outline_rounded),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: TextFormField(
            controller: controllerRollNum,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: " Roll No",
              // hintText: '  name.roll_no@srec.ac.in'),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person_outline_rounded),
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        //   child: TextFormField(
        //     keyboardType: TextInputType.emailAddress,
        //     textInputAction: TextInputAction.next,
        //     cursorColor: kPrimaryColor,
        //     autocorrect: false,
        //     onChanged: (value) {
        //       stock = value;
        //     },
        //     decoration: InputDecoration(
        //       hintText: " Stock",
        //       // hintText: '  name.roll_no@srec.ac.in'),
        //       prefixIcon: Padding(
        //         padding: const EdgeInsets.all(defaultPadding),
        //         child: Icon(Icons.format_list_numbered_rounded),
        //       ),
        //     ),
        //     // controller: TextEditingController()..text = bookId,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: TextFormField(
            controller: controllerDate,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: " Date Issue",
              // hintText: '  name.roll_no@srec.ac.in'),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.date_range),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: TextFormField(
            controller: controllerExpire,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: " Expire Date",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.calendar_month_rounded),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 120, right: 120),
          child: SizedBox(
            height: 40,
            width: 100,
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
              onPressed: () {},
              child: Text(
                "UPLOAD",
                // style: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ),
        //
      ]),
    );
  }
}
