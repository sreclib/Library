import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key}) : super(key: key);

  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 156, 83, 230),
        title: Text("Favorites"),
      ),
    );
  }
}
