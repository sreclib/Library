// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'fav_pro.dart';

// class FavoritePage extends StatelessWidget {
//   const FavoritePage({Key? key}) : super(key: key);

//   @override
  
//   Widget build(BuildContext context) {
//     final provider = FavoriteProvider.of(context);
//       String book = '';

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favorites'),
//       ),
//       body:  StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('Bookdata')
//                     .snapshots(),
//                 builder: (context, snapshots) {
//                   return (snapshots.connectionState == ConnectionState.waiting)
//                       ? Center(
//                           child: CircularProgressIndicator(),
//                         )
//                       : ListView.separated(
//                           itemCount: snapshots.data!.docs.length,
//                           itemBuilder: (context, index) {
//                             var data = snapshots.data!.docs[index].data()
//                                 as Map<String, dynamic>;

//                             if (book.isEmpty) {
//                               return ExpansionTile(
//                                 textColor: Color.fromARGB(255, 156, 83, 230),
//                                 // trailing: IconButton(
//                                 //   color: Color.fromARGB(255, 156, 83, 230),
//                                 //   icon: (data['like'] == true)
//                                 //       ? Icon(Icons.favorite)
//                                 //       : Icon(Icons.favorite_outline_outlined),
//                                 //   onPressed: () => {
//                                 //     // for favourite and un-favourite
//                                 //     if (data['like'] == true)
//                                 //       {
//                                 //         FirebaseFirestore.instance
//                                 //             .collection('users')
//                                 //             .doc(FirebaseAuth
//                                 //                 .instance.currentUser!.uid)
//                                 //             .collection('fav')
//                                 //             .doc(data['Book name'])
//                                 //             .update({'like': false})
//                                 //       }
//                                 //     else
//                                 //       {
//                                 //         FirebaseFirestore.instance
//                                 //             .collection('template')
//                                 //             .doc(FirebaseAuth
//                                 //                 .instance.currentUser!.uid)
//                                 //             .collection('fav')
//                                 //             .doc(data['Book name'])
//                                 //             .update({'like': true})
//                                 //       }
//                                 //   },
//                                 //   // onPressed: () => setState(
//                                 //   //     () => _isFavorited[i] = !_isFavorited[i],),
//                                 //   //   icon: _isFavorited[i]
//                                 //   //       ? Icon(Icons.favorite)
//                                 //   //       : Icon(Icons.favorite_border),
//                                 // ),
//                                 iconColor: Color.fromARGB(255, 79, 18, 80),
//                                 title: Text(
//                                   data['Book name'],
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 children: <Widget>[
//                                   Wrap(
//                                     textDirection: TextDirection.ltr,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Book ID: ${data['Id']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Author name: ${data['Author name']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Publisher name:  ${data['Publisher']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Edition:  ${data['Edition']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               );
//                             }
//                             if (data['Book name']
//                                 .toString()
//                                 .toLowerCase()
//                                 .startsWith(book.toLowerCase())) {
//                               return ExpansionTile(
//                                 textColor: Color.fromARGB(255, 156, 83, 230),
//                                 trailing: IconButton(
//               onPressed: () {
//                 provider.toggleFavorite(data as String);
//               },
//               icon: provider.isExist(data as String)
//                   ? const Icon(Icons.favorite, color: Colors.red)
//                   : const Icon(Icons.favorite_border),
//             ),
//                                 title: Text(
//                                   data['Book name'],
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 children: <Widget>[
//                                   Wrap(
//                                     textDirection: TextDirection.ltr,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Book ID: ${data['Id']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Author name: ${data['Author name']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Publisher name: ${data['Publisher']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             child: Text(
//                                               'Edition:  ${data['Edition']}',
//                                               style: TextStyle(
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               );
//                             }
//                             return Container();
//                           },
//                           separatorBuilder: (context, index) => const Divider(
//                                 thickness: 1,

//                                 // height: 15,
//                                 color: Color.fromARGB(255, 206, 206, 206),
//                               ));
//                 },
//               ),
//     );
//   }
// }
