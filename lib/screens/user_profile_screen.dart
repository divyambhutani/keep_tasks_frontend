import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var email = "bhutianimukul@gmail.com";
  var imageUrl = '';
  final ImagePicker _picker = ImagePicker();

  XFile? file;
  bool personalEnable = false;

  var errorMessage = "";
  TextEditingController _firstPassword = TextEditingController();
  TextEditingController _secondPassword = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext ctx) async {
    String valueText1 = "";
    String valueText2 = "";

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Change Password'),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(70),
                ),
              ),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        valueText1 = value;
                      });
                    },
                    controller: _firstPassword,
                    decoration: InputDecoration(hintText: "New Password"),
                    obscureText: true,
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        valueText2 = value;
                      });
                    },
                    controller: _secondPassword,
                    decoration:
                        InputDecoration(hintText: " Re-type New Password"),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _firstPassword.text = '';
                  _secondPassword.text = '';
                  if (valueText1 == valueText2 && valueText1.length != 0) {
                    setState(() {
                      errorMessage = "Password Changed, Click Save to update";
                      codeDialog = valueText1;
                    });
                  } else {
                    setState(() {
                      errorMessage = "Password Do not match Try Again";
                      valueText1 = '';
                      valueText2 = '';
                    });
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  late String codeDialog;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        // color: Colors.grey.withOpacity(.3),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 15),
                Divider(color: Colors.black),
                Text("Profile Photo"),
                Divider(color: Colors.black),
                SizedBox(height: 15),
                Center(
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 70,
                        child: ClipOval(
                          child: file?.path != null
                              ? Image.file(
                                  io.File(file!.path),
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  "https://www.w3schools.com/howto/img_avatar.png",
                                  height: 150,
                                  width: 150,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                              onPressed: () async => {
                                    file = await _picker.pickImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 10),
                                    setState(() {
                                      file = file;
                                    })
                                  },
                              icon: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                              )),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(color: Colors.black),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Row(
                children: [
                  Center(child: Text("Personal Information")),
                  IconButton(
                      onPressed: () => {
                            setState(() {
                              personalEnable = true;
                            })
                          },
                      icon: Icon(Icons.edit))
                ],
              ),
              Divider(color: Colors.black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name"),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextField(
                      enabled: personalEnable,
                      controller: nameController,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Age "),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      enabled: personalEnable,
                      controller: ageController,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email"),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextField(
                      decoration: InputDecoration(labelText: email),
                      enabled: false,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ]),
            Divider(color: Colors.black),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _displayTextInputDialog(context);
              },
              child: Text('Change Password'),
            ),
            Text(
              errorMessage,
              style: TextStyle(
                color: Colors.red,
                fontSize: 10,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
