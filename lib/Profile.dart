import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:srec_library/testfinal.dart';
import 'package:srec_library/testp.dart';
import 'package:srec_library/testpopz.dart';

import 'Color.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  late double deviceHeight;
  late double deviceWidth;

  double bordeR = 15;
  List<Uint8List?> imageData = [null];
  static TextEditingController namecontroller = TextEditingController();
  static bool canEdit = true;

  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: TextButton(
          child: Text(
            "Cancel",
            style: TextStyle(
              fontSize: 17,
              color: Color.fromARGB(255, 118, 42, 131),
            ),
          ),
          onPressed: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        actions: [
          TextButton(
            child: Text(
              "Done",
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 118, 42, 131),
              ),
            ),
            onPressed: () {
              namecontroller.clear();
            },
          ),
        ],
        title: Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(
              color: Color.fromARGB(255, 118, 42, 131),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () async {
                            final ImagePicker _picker = ImagePicker();
                            final XFile? image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            imageData[0] = await image?.readAsBytes();
                            setState(() {});
                          },
                          child: imageData[0] == null
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 4,
                                      color: Color.fromARGB(255, 118, 42, 131),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                      child: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(255, 118, 42, 131),
                                    size: 120,
                                  )),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 4,
                                      color: Color.fromARGB(255, 118, 42, 131),
                                    ),
                                    shape: BoxShape.circle,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //       spreadRadius: 0,
                                    //       blurRadius: 2,
                                    //       color: Colors.black.withOpacity(0.1),
                                    //       offset: Offset(0, 10))
                                    // ],

                                    // borderRadius: BorderRadius.circular(bordeR),

                                    image: DecorationImage(
                                      alignment: Alignment.center,
                                      fit: BoxFit.contain,
                                      image: MemoryImage(imageData[0]!),
                                    ),
                                  ),
                                ),
                        ),
                        Visibility(
                          visible: imageData[0] != null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  imageData[0] = null;
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Color.fromARGB(255, 156, 83, 230),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              autocorrect: false,
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                hintText: " Name",
                suffixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.verified_user_sharp)),
                prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.nest_cam_wired_stand)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter the name';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  name = value!;
                });
              },
            ),
          ),
          //     Padding(
          //       padding: const EdgeInsets.only(top: 70),
          //       child: StreamBuilder<List<User>>(
          //         stream: readUser(),
          //         builder: (context, snapshot) {
          //           if (snapshot.hasError) {
          //             return Text('Something went wrong! ${snapshot.error}');
          //           } else if (snapshot.hasData) {
          //             final User = snapshot.data!;

          //             return Text("d d"
          //                 //         snapshot.data!.name,

          //                 );
          //           } else {
          //             return Center(child: CircularProgressIndicator());
          //           }
          //         },
          //       ),
          //     ),

          //     // Column(
          //     //   children: [
          //     //     Padding(
          //     //       padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
          //     //       child: TextFormField(
          //     //         controller: namecontroller,
          //     //         obscureText: false,
          //     //         keyboardType: TextInputType.emailAddress,
          //     //         textInputAction: TextInputAction.next,
          //     //         cursorColor: kPrimaryColor,
          //     //         autocorrect: false,
          //     //         onChanged: (value) {
          //     //           namecontroller = value as TextEditingController;
          //     //         },
          //     //         decoration: const InputDecoration(
          //     //           hintText: " Name",
          //     //           prefixIcon: Padding(
          //     //             padding: EdgeInsets.all(defaultPadding),
          //     //             child: Icon(Icons.person),
          //     //           ),
          //     //         ),
          //     // validator: (value) {
          //     //   if (value!.isEmpty) {
          //     //     return 'Please Enter Your name';
          //     //   } else {
          //     //     return null;
          //     //   }
          //     // },
          //     // onSaved: (value) {
          //     //   setState(() {
          //     //     Name = value!;
          //     //   });
          //     // },
          //     //   ),
          //     // ),
          //     // SizedBox(
          //     //     height: 40,
          //     //     width: 100,
          //     //     child: ElevatedButton(
          //     //         onPressed: () async {
          //     //        namecontroller.text;
          //     //         },
          //     //         child: Text("c d")))
          //   ],
          // ),
        ],
      ),
    );
  }
}
 

// Future createUser(User user) async {
//   final docUser = FirebaseFirestore.instance.collection('users').doc();
//   final json = user.toJson();
//   await docUser.set(json);
// }

// class User {
  // final String name;
  // final String age;
  // final String birthday;

//   User({
//     required this.name,
//     // required this.age,
//     // required this.birthday,
//   });
//   Map<String, dynamic> toJson() => {
//         'name': name,
//         // 'age': age,
//         // 'birthday': birthday,
//       };
// }
