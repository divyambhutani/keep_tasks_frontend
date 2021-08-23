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
                  width: 250,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email"),
                SizedBox(
                  height: 10,
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
            onPressed: () => {},
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