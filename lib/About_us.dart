import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class About_us extends StatefulWidget {
  const About_us({Key? key}) : super(key: key);

  State<About_us> createState() => _About_usState();
}

class _About_usState extends State<About_us> {
   late double deviceHeight;
  late double deviceWidth;
  Widget build(BuildContext context) {
       deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold();
  }
}
