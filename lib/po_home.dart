import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:srec_library/po_favorite.dart';
import 'package:srec_library/po_favpro.dart';

class po_home extends StatelessWidget {
  const po_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      CollectionReference ref = FirebaseFirestore.instance.collection('Bookdata');

    final words = nouns.take(50).toList();
    final provider = po_favpro.of(context);
    String book = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Words'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Bookdata').snapshots(),
        builder: (context, snapshots) {
          return (snapshots.connectionState == ConnectionState.waiting)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;

                    if (book.isEmpty) {
                      return ExpansionTile(
                        textColor: Color.fromARGB(255, 156, 83, 230),
                        title: Text(
                          data['Book name'],
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        trailing: IconButton(
              onPressed: () {
                provider.toggleFavorite( snapshots.data!.docs[index].id);
              },
              icon: provider.isExist( snapshots.data!.docs[index].id)
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            ),
                        iconColor: Color.fromARGB(255, 79, 18, 80),
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
                                      'Book ID: ${data['Id']}',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      'Author name: ${data['Author name']}',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      'Publisher name:  ${data['Publisher']}',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                    if (data['Book name']
                        .toString()
                        .toLowerCase()
                        .startsWith(book.toLowerCase())) {
                      return ExpansionTile(
                        textColor: Color.fromARGB(255, 156, 83, 230),
                        title: Text(
                          data['Book name'],
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
                                      'Book ID: ${data['Id']}',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      'Author name: ${data['Author name']}',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      'Publisher name: ${data['Publisher']}',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                  // separatorBuilder: (context, index) => const Divider(
                  //       thickness: 1,

                  //       // height: 15,
                  //       color: Color.fromARGB(255, 206, 206, 206),
                  //     )
                );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final route = MaterialPageRoute(
            builder: (context) => const po_favorite(),
          );
          Navigator.push(context, route);
        },
        label: const Text('Favorites'),
      ),
    );
  }
}
