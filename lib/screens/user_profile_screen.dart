import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(child: CircleAvatar()),
          Column(
            children: [
              Row(
                children: [
                  Text("Name"),
                  TextField(
                    enabled: false,
                  ),
                  // IconButton(icon:Icons.edit,onPressed:(){});
                ],
              ),
              Row(
                children: [
                  Text("Age"),
                  TextField(),
                ],
              ),
              Row(
                children: [
                  Text(""),
                  TextField(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
