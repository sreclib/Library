import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srec_library/Ad_books.dart';

import 'package:srec_library/Color.dart';
import 'package:srec_library/Student_login.dart';
import 'package:srec_library/Usercheck.dart';
import 'package:srec_library/po_home.dart';
import 'Home.dart';
import 'Login.dart';
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
//      return ChangeNotifierProvider(
//       create: (context) => po_favpro(),
//       child: const MaterialApp(
//         home: po_home(),
//       ),
//     );
//   }
// }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            iconTheme: IconThemeData(
              color: Color.fromARGB(255, 156, 83, 230),
            ),
            focusColor: Color.fromARGB(255, 156, 83, 230),
            splashColor: Color.fromARGB(255, 156, 83, 230),
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            iconButtonTheme: IconButtonThemeData(
              style: IconButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 156, 83, 230),
              ),
            ),
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
        // home: StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return const Home();
        //     } else {
        //       return const Login();
        //     }
        //   },
        // ));
        home: const po_home());
  }
}
