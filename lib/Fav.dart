import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:srec_library/Utility.dart';
import 'package:srec_library/bro.dart';
import 'package:srec_library/tes5.dart';
import 'package:srec_library/test6.dart';
import 'Fav.dart';
import 'My_book.dart';
import 'Profile.dart';

class Fav extends StatefulWidget {
  // const My_book({Key key}) : super(key: key);

  @override
  State<Fav> createState() => _Fav();
}

class _Fav extends State<Fav> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('fav');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 156, 83, 230),
          title: const Text("Library"),
          // actions: <Widget>[
          //   IconButton(
          //       onPressed: () async {
          //         // await FirebaseAuth.instance.signOut();
          //       },
          //       icon: Icon(Icons.logout_outlined))
          // ],
        ),
        body: Stack(
          children: [
            // const Padding(
            //   padding: EdgeInsets.only(top: 5),
            //   child: SizedBox(child: buildFloatingSearchBar(context)),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: StreamBuilder(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        dynamic doc = snapshot.data?.docs[index].data();

                        return ExpansionTile(
                          textColor: Color.fromARGB(255, 156, 83, 230),
                          trailing: IconButton(
                            color: Color.fromARGB(255, 156, 83, 230),
                            icon: (doc['like'] == true)
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_outline_outlined),
                            onPressed: () => {
                              // for favourite and un-favourite
                              if (doc['like'] == true)
                                {
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .collection('lendbook')
                                      .doc(doc['Book id'])
                                      .update({'like': false})
                                }
                              else
                                {
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .collection('lendbook')
                                      .doc(doc['Book id'])
                                      .update({'like': true})
                                }
                            },
                            // onPressed: () => setState(
                            //     () => _isFavorited[i] = !_isFavorited[i],),
                            //   icon: _isFavorited[i]
                            //       ? Icon(Icons.favorite)
                            //       : Icon(Icons.favorite_border),
                          ),
                          iconColor: Color.fromARGB(255, 79, 18, 80),
                          title: Text(
                            doc['Book name'],
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          children: <Widget>[
                            Wrap(
                              textDirection: TextDirection.ltr,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                        'Book ID: ${doc['Book id']}\n',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                        'Author Name: ${doc['Author name']}',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Set()));
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
      ),
    );
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
