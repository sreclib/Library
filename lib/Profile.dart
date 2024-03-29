import 'dart:typed_data';

import 'package:srec_library/Settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Color.dart';
import 'Fav.dart';
import 'Home.dart';
import 'My_book.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  String book = '';
  late double deviceHeight;
  late double deviceWidth;

  double bordeR = 15;
  List<Uint8List?> imageData = [null];
  static TextEditingController namecontroller = TextEditingController();
  static bool canEdit = true;

  Widget build(BuildContext context) {
    Stream ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 70,
            leading: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 77, 26, 86),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            actions: [
              IconButton(
                color: Color.fromARGB(255, 77, 26, 86),
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
            title: Center(
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: Color.fromARGB(255, 77, 26, 86),
                ),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 1,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () async {
                                final ImagePicker _picker = ImagePicker();
                                final XFile? image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                imageData[0] = await image?.readAsBytes();
                                setState(() {});
                              },
                              child: imageData[0] == null
                                  ? Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 4,
                                          color:
                                              Color.fromARGB(255, 77, 26, 86),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(
                                          child: Icon(
                                        Icons.person,
                                        color: Color.fromARGB(255, 77, 26, 86),
                                        size: 120,
                                      )),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 4,
                                          color:
                                              Color.fromARGB(255, 77, 26, 86),
                                        ),
                                        shape: BoxShape.circle,
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       spreadRadius: 0,
                                        //       blurRadius: 2,
                                        //       color: Colors.black.withOpacity(0.1),
                                        //       offset: Offset(0, 10))
                                        // ],

                                        // borderRadius: BorderRadius.circular(bordeR),

                                        image: DecorationImage(
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,
                                          image: MemoryImage(imageData[0]!),
                                        ),
                                      ),
                                    ),
                            ),
                            Visibility(
                              visible: imageData[0] != null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      imageData[0] = null;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Color.fromARGB(255, 77, 26, 86),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: StreamBuilder(
                  stream: ref,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong! ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(children: [
                          SizedBox(
                            height: 60,
                            width: 360,
                            child: Container(
                              // color: kPrimaryLightColor,
                              decoration: ShapeDecoration(
                                color: kPrimaryLightColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),

                              child: ListTile(
                                splashColor: Color.fromARGB(255, 77, 26, 86),
                                title: Wrap(
                                  children: [
                                    Text(
                                      ' Name :  ' + snapshot.data['name'],
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 77, 26, 86),
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: SizedBox(
                              height: 60,
                              width: 360,
                              child: Container(
                                // color: kPrimaryLightColor,
                                decoration: ShapeDecoration(
                                  color: kPrimaryLightColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),

                                child: ListTile(
                                  splashColor: Color.fromARGB(255, 77, 26, 86),
                                  title: Wrap(
                                    children: [
                                      Text(
                                        ' Email ID :  ' +
                                            snapshot.data['email'],
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 77, 26, 86),
                                            fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 156, 83, 230),
            child: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
          ),
          bottomNavigationBar: SizedBox(
            height: 50,
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 4.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.book_rounded),
                    color: Color.fromARGB(255, 156, 83, 230),
                    splashColor: Color.fromARGB(255, 156, 83, 230),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => My_book()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    color: Color.fromARGB(255, 156, 83, 230),
                    splashColor: Color.fromARGB(255, 156, 83, 230),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Fav()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    splashColor: Color.fromARGB(255, 156, 83, 230),
                    color: Color.fromARGB(255, 156, 83, 230),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Set1()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person),
                    splashColor: Color.fromARGB(255, 156, 83, 230),
                    color: Color.fromARGB(255, 156, 83, 230),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Home(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 0.8);

        const end = Offset.zero;
        const curve = Curves.fastLinearToSlowEaseIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
