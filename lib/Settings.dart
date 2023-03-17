import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'About_us.dart';
import 'Fav.dart';
import 'Fpasswrd.dart';
import 'Home.dart';
import 'My_book.dart';
import 'Profile.dart';

class Set1 extends StatefulWidget {
  const Set1({super.key});

  @override
  State<Set1> createState() => _Set1State();
}

class _Set1State extends State<Set1> {
   late double deviceHeight;
  late double deviceWidth;
  @override
  Widget build(BuildContext context) {
        deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
                title: Text("About Us"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About_us()));
                },
              ),
              ListTile(
                title: Text("Log out"),
                onTap: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => Re)));
                },
              )
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
      pageBuilder: (context, animation, secondaryAnimation) => Home(),
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

