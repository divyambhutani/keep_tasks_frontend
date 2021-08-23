import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var email = "bhutianimukul@gmail.com";
  var imageUrl = 'https://www.w3schools.com/howto/img_avatar.png';
  bool personalEnable = false;
  bool passEnable = false;

  TextEditingController _firstPassword = TextEditingController();
  TextEditingController _secondPassword = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    String valueText1 = "";
    String valueText2 = "";
    String errorMessage = '';
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Change Password'),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
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
                  Text(
                    errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                    ),
                  )
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
                  if (valueText1 == valueText2 && valueText1.length != 0) {
                    setState(() {
                      codeDialog = valueText1;
                      Navigator.pop(context);
                    });
                  } else {
                    setState(() {
                      errorMessage = 'Passwords do not match';
                    });
                  }
                },
              ),
            ],
          );
        });
  }

  late String codeDialog;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.grey.withOpacity(.3),
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
                        child: Image.network(
                          imageUrl,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
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
                              onPressed: () => {},
                              icon: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                              )),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ))
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
                IconButton(onPressed: () => {}, icon: Icon(Icons.edit))
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
              print(codeDialog);
            },
            child: Text('Change Password'),
          ),
        ],
      ),
    );
  }
}




// CircleAvatar(
//                   radius: 100,
//                   backgroundImage: NetworkImage(imageUrl),
//                   backgroundColor: Colors.black,
//                   child: CircleAvatar(
//                     radius: 100,
//                     backgroundColor: Colors.black87.withOpacity(0.7),
//                     child: IconButton(
//                       onPressed: () => {},
//                       icon: Icon(
//                         Icons.edit,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ),




// Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//             Row(
//               children: [
//                 Center(child: Text("Privacy and security")),
//                 IconButton(onPressed: () => {}, icon: Icon(Icons.edit))
//               ],
//             ),
//             Divider(color: Colors.black),
//           ]),
              
            //   Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Password"),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.5,
            //       child: TextField(
            //         obscureText: true,
            //         enabled: passEnable,
            //         controller: passController,
            //       ),
            //     ),
            //   ],
            // ),