import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class po_favpro extends ChangeNotifier {
  List<String> _words = [];
  List<String> get words => _words;
  CollectionReference ref = FirebaseFirestore.instance.collection('Bookdata');

  var data = {Map<String, dynamic>};

  void toggleFavorite(String ref) {
    final isExist = data.contains(ref);
    if (isExist) {
      data.remove(ref);
    // } else {
    //   results.add(ref);
    }
    notifyListeners();
  }

  bool isExist(String ref) {
    final isExist = _words.contains(ref);
    return isExist;
  }

  void clearFavorite() {
    _words = [];
    notifyListeners();
  }

  static po_favpro of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<po_favpro>(
      context,
      listen: listen,
    );
  }
}
