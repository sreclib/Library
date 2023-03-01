// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FavoriteProvider extends ChangeNotifier {
//     CollectionReference ref = FirebaseFirestore.instance.collection('Bookdata');

//    var data = snapshots.data!.docs[index].data()
//                                 as Map<String, dynamic>;
//   // List<String> data = [];
//   // List<String> get words => data;

//   void toggleFavorite(String word) {
//     final isExist = data.contains(data);
//     if (isExist) {
//       data.remove(word);
//     } else {
//       data.add(word);
//     }
//     notifyListeners();
//   }

//   bool isExist(String word) {
//     final isExist = data.contains(word);
//     return isExist;
//   }

//   void clearFavorite() {
//     data = [];
//     notifyListeners();
//   }

//   static FavoriteProvider of(
//     BuildContext context, {
//     bool listen = true,
//   }) {
//     return Provider.of<FavoriteProvider>(
//       context,
//       listen: listen,
//     );
//   }
// }