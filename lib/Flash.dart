import 'package:flutter/material.dart';

class Flash extends StatefulWidget {
  const Flash({Key? key}) : super(key: key);

  State<Flash> createState() => _FlashState();
}

class _FlashState extends State<Flash> {
   late double deviceHeight;
  late double deviceWidth;
  Widget build(BuildContext context) {
        deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold();
  }
}
