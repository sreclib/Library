import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:srec_library/Admin_login.dart';
import 'package:srec_library/test.dart';
import 'Color.dart';
import 'Home.dart';

class Admin_lend extends StatefulWidget {
  const Admin_lend({Key? key}) : super(key: key);

  State<Admin_lend> createState() => _Admin_lendState();
}

class _Admin_lendState extends State<Admin_lend> {
  final controllerBookName = TextEditingController();
  final controllerRollNo = TextEditingController();

  final controllerBookId = TextEditingController();
  final controllerAuthorName = TextEditingController();
  final controllerPublisherName = TextEditingController();
  final controllerEdition = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
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
              controller: controllerRollNo,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: " Roll No",
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
                    child: Icon(
                      Icons.book_outlined,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: TextFormField(
              controller: controllerBookId,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: " Book ID",
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
              controller: controllerAuthorName,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: " Author Name",
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
              controller: controllerPublisherName,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: " Publisher Name",
                // hintText: '  name.roll_no@srec.ac.in'),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person_add_alt),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: TextFormField(
              controller: controllerEdition,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: " Edition",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.star_border_outlined),
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
                onPressed: () {
                  final book = Bookdata(
                    bookName: controllerBookName.text,
                    bookId: controllerBookId.text,
                    authorName: controllerAuthorName.text,
                    publisher: controllerPublisherName.text,
                    edition: controllerEdition.text,
                  );
                  createBookdata(book);

                  // Navigator.pop(context);
                },
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
  // ignore: dead_code
  Future createBookdata(Bookdata book) async {
    final docBookdata = FirebaseFirestore.instance.collection('takenbook').doc();
    final json = book.toJson();
    await docBookdata.set(json);
  }
}
class Bookdata {
  // final String id;
  final String bookId;
  final String bookName;
  final String authorName;
  final String publisher;
  final String edition;

  Bookdata({
    // this.id = '',
    required this.bookId,
    required this.bookName,
    required this.authorName,
    required this.publisher,
    required this.edition,
  });
  Map<String, dynamic> toJson() => {
        // 'id': id,
        'Id': bookId,
        'Book name': bookName,
        'Author name': authorName,
        'Publisher': publisher,
        'Edition': edition,
      };

  static fromJson(data) {}
}
