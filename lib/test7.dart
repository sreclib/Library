// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class notes extends StatefulWidget {
//   const notes({super.key});

//   @override
//   State<notes> createState() => _notesState();
// }

// class _notesState extends State<notes> {
//   String? noteValue;
//   void initState() {
//     super.initState();
//     getNotes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: noteValue == null ? Text('no notes') : Text(noteValue!),
//       ),
//     );
//   }

//   void getNotes() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     noteValue = pref.getString('noteData');
//     setState(() {});
//   }
// }
