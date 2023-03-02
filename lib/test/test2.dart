import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("ll"),
        ),
        
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextField(
              controller: controllerName,
              decoration: decoration('name'),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerAge,
              decoration: decoration('age'),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerDate,
              decoration: decoration('birthday'),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              child: Text("Create"),
              onPressed: () {
                final user = User(
                  name: controllerName.text,
                  age: controllerAge.text,
                  birthday: controllerDate.text,
                );
                createUser(user);
                // Navigator.pop(context);
              },
            )
          ],
        ),
        // body:  StreamBuilder<List<User>>(
        //     stream: readUsers(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         final users = snapshot.data!;

        //         return ListView(
        //           children: users.map(buildUser).toList(),
        //         );
        //       } else {
        //         return Center(child: CircularProgressIndicator());
        //       }
        //     }),
      );
  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      );
   Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(child: Text('${user.age}')),
        title: Text(user.name),
        // subtitle: Text(user.birthday.toIso8601String()),
      );

  // Stream<List<User>> readUsers() => FirebaseFirestore.instance
  //     .collection('users')
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final String age;
  final String birthday;

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
}
