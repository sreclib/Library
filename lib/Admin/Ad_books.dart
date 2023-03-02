import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ad_books extends StatefulWidget {
  @override
  State<Ad_books> createState() => _Ad_books();
}

class _Ad_books extends State<Ad_books> {
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 156, 83, 230),
          title: const Text("Library"),
          actions: <Widget>[
            IconButton(
                onPressed: () async {
                  // await FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.logout_outlined))
          ]),
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
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .collection('lendbook')
                                    .doc(doc['Book id'])
                                    .update({'like': false})
                              }
                            else
                              {
                                FirebaseFirestore.instance
                                    .collection('template')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
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
                          doc['name'],
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
                                      'Book ID: ${doc['Book id']}',
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
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      'Publisher name: ${doc['Publisher']}',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      'Edition: ${doc['Edition']}',
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
    );
  }
}
