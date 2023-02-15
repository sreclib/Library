import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:srec_library/test2.dart';

class test extends StatefulWidget {
  const test({super.key});
  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("All uses")
            // TextField(
            //   controller: controller,
            // ),
            // actions: [
            //   IconButton(
            //     icon: Icon(Icons.add),
            //     onPressed: () {
            //       final name = controller.text;
            //       createUser(name: name);
            //     },
            //   )
            // ],
            ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserPage(),
            ));
          },
        ),
        body: StreamBuilder<List<User>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong! ${snapshot.error}');
              } else if (snapshot.hasData) {
                final users = snapshot.data!;

                return ListView(
                  children: users.map(buildUser).toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );

  Widget buildUser(User user) => ListTile(
        
        title: Text(user.name),
        subtitle: Text(user.birthday.toIso8601String()),
      );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    var name;
    final toJson = {
      'id': docUser.id,
      'name': name,
      'age': 21,
      'birthday': DateTime(2001, 7, 28),
    };
  }
}

class User {
  String id;
  final String name;
  final int age;
  final DateTime birthday;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.birthday,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'birthday': birthday,
      };
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        birthday: (json['birthday'] as Timestamp).toDate(),
      );
}
