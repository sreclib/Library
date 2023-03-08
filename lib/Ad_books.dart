import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ad_books extends StatefulWidget {
  @override
  State<Ad_books> createState() => _Ad_books();
}

class _Ad_books extends State<Ad_books> {
  CollectionReference ref = FirebaseFirestore.instance.collection('takenbook');
  String book = '';
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
            padding: const EdgeInsets.only(top: 10, left: 12),
            child: SizedBox(
              height: 50,
              width: 370,
              child: TextField(
                cursorColor: Color.fromARGB(255, 156, 83, 230),
                decoration: InputDecoration(
                  focusColor: Color.fromARGB(255, 156, 83, 230),
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search...',
                  hoverColor: Color.fromARGB(255, 118, 42, 131),
                  iconColor: Color.fromARGB(255, 118, 42, 131),
                ),
                onChanged: (val) {
                  setState(() {
                    book = val;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('takenbook')
                  .snapshots(),
              builder: (context, snapshots) {
                return (snapshots.connectionState == ConnectionState.waiting)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshots.data!.docs[index].data()
                              as Map<String, dynamic>;

                          if (book.isEmpty) {
                            return ExpansionTile(
                              textColor: Color.fromARGB(255, 156, 83, 230),
                              title: Text(
                                data['Roll no'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              children: <Widget>[
                                Wrap(
                                  textDirection: TextDirection.ltr,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Book name: ${data['Id']}',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Book ID: ${data['Id']}',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Author name: ${data['Author name']}',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Publisher name:  ${data['Publisher']}',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Edition:  ${data['Edition']}',
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
                          }
                          if (data['Roll no']
                              .toString()
                              .toLowerCase()
                              .startsWith(book.toLowerCase())) {
                            return ExpansionTile(
                              textColor: Color.fromARGB(255, 156, 83, 230),
                              title: Text(
                                data['Roll no'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              children: <Widget>[
                                Wrap(
                                  textDirection: TextDirection.ltr,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Book name: ${data['Id']}',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Book ID: ${data['Id']}',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Author name: ${data['Author name']}',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Publisher name: ${data['Publisher']}',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Edition:  ${data['Edition']}',
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
                          }
                          return Container();
                        },
                        separatorBuilder: (context, index) => const Divider(
                              thickness: 1,

                              // height: 15,
                              color: Color.fromARGB(255, 206, 206, 206),
                            ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
