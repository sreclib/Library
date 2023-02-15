import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srec_library/Admin_login.dart';
import 'package:srec_library/Admin_upload.dart';

import 'package:srec_library/Color.dart';
import 'package:srec_library/Login.dart';
import 'package:srec_library/My_book.dart';
import 'package:srec_library/Reset.dart';
import 'package:srec_library/Settings.dart';
import 'package:srec_library/Sign_up.dart';
import 'package:srec_library/sp/homeScreen.dart';
import 'package:srec_library/sp/loginScreen.dart';
import 'package:srec_library/sp/register.dart';
import 'package:srec_library/test10.dart';
import 'package:srec_library/test3.dart';
import 'package:srec_library/test4.dart';
import 'package:srec_library/test8.dart';
import 'package:srec_library/test9.dart';
import 'package:srec_library/testangry.dart';

import 'package:srec_library/testfinal.dart';
import 'package:srec_library/testp.dart';
import 'package:srec_library/testpopz.dart';
import 'Profile.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override

  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: kPrimaryColor,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: kPrimaryLightColor,
              iconColor: kPrimaryColor,
              prefixIconColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
            )),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Home();
            } else {
              return Login();
            }
          },
        ));
    // home: Home(),
    // );
  }
}
