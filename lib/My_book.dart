import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:srec_library/Auth.dart';
import 'package:srec_library/Fpasswrd.dart';
import 'package:srec_library/Fpasswrd.dart';
import 'package:srec_library/Fpasswrd.dart';
import 'package:srec_library/testpopz.dart';

class My_book extends StatefulWidget {
  final currentUser = FirebaseAuth.instance;
  @override
  _My_bookState createState() => _My_bookState();
}

class _My_bookState extends State<My_book> {
  final controllerBookName = TextEditingController();
  final controllerBookId = TextEditingController();
  final controllerAuthorName = TextEditingController();
  final controllerPublisherName = TextEditingController();
  final controllerEdition = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 156, 83, 230),
          title: Text("Library"),
          actions: <Widget>[]),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: StreamBuilder<List<User>>(
              stream: readUser(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong! ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final Bookdata = snapshot.data!;

                  return ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: Bookdata.length,
                    // dynamic doc = snapshot.data?.docs[index].data();

                    itemBuilder: (context, i) {
                      return ExpansionTile(
                        textColor: Colors.black,
                        // textColor: Color.fromARGB(255, 156, 83, 230),

                        iconColor: Color.fromARGB(255, 79, 18, 80),

                        title: Text(
                          snapshot.data![i].popz,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        children: <Widget>[
                          Wrap(
                            alignment: WrapAlignment.start,
                            runAlignment: WrapAlignment.start,
                            textDirection: TextDirection.ltr,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  textAlign: TextAlign.left,
                                  'Author Name : ' + snapshot.data![i].popz,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  ', Book Id : ' + snapshot.data![i].popz,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ', Edition : ' + snapshot.data![i].popz,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ', Publisher Name : ' +
                                      snapshot.data![i].popz,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 2,

                      // height: 15,
                      color: Color.fromARGB(255, 206, 206, 206),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Stream<List<User>> readUser() => FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('lendbook')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  List<String> contents = [];

  // final String uid;
  // final String name;
  // final String bookId;
  final String popz;

  // final String emailId;
  // final String lend;

  User({
    // required this.uid,
    // required this.name,
    // required this.bookId,
    required this.popz,
    // required this.emailId,
    // required this.lend,
  });
  Map<String, dynamic> toJson() => {
        // 'uid': uid,
        // 'name': name,
        'popz': popz,
        // 'Book id': bookId,
        // 'lend': lend,
        // 'email': emailId,
      };
  static User fromJson(Map<String, dynamic> json) => User(
        // uid: json['uid'],
        // name: json['name'],
        // bookId: json['Book id'],
        // lend: json['lend'],
        popz: json['popz'],
        // emailId: json['email'],
      );
}

List<User> book = [
  User(
    // name: json.toString(),
    // bookId: json.toString(),
    // uid: json.toString(),
    // lend: json.toString(),
    popz: json.toString(),
    // emailId: json.toString(),
  ),
];
