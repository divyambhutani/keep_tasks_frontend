import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/task_provider.dart';
import 'login_screen.dart';
import 'init_screen.dart';

class LogOutScreen extends StatefulWidget {
  static const routeName = '/LogOutScreen';
  @override
  _LogOutScreenState createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  Future<String>? dialog(String desc, String s) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: Text('$s'),
        content: Text("$desc"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('OK!'))
        ],
      ),
    );
  }

  void logout(context) async {
    try {
      final provider = Provider.of<TaskProvider>(context, listen: false);
      await provider.logout();
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } catch (e) {
      dialog("Unable To logout", "Please try again");
    }
  }

  void logoutOnPress(context) {
    logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Manage Account",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.blue,
                  blurRadius: 10.0,
                  offset: Offset(5.0, 5.0),
                ),
                Shadow(
                  color: Colors.red,
                  blurRadius: 10.0,
                  offset: Offset(-5.0, 5.0),
                ),
              ],
            ),
          ),
          Column(
            children: [
              InkWell(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * .1,
                  child: Image.network(
                    "https://www.computerhope.com/issues/pictures/logout.jpg",
                  ),
                ),
                onTap: () => logoutOnPress(context),
              ),
              Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      color: Colors.red,
                      blurRadius: 10.0,
                      offset: Offset(-5.0, 5.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              InkWell(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * .1,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwshw18fNHAVv-jdB5LEUn-6CN7aNwdcCQCEpujzvrB3ht2SZQ4xox6tjgP_OjuOUWrXU&usqp=CAU",
                  ),
                ),
                onTap: () => logoutAll(context),
              ),
              Text(
                "Logout All",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      color: Colors.red,
                      blurRadius: 10.0,
                      offset: Offset(-5.0, 5.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Divider(height: 10),
          Column(
            children: [
              InkWell(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * .1,
                  child: Image.network(
                    "https://img.icons8.com/color/48/000000/delete-user-data.png",
                  ),
                ),
                onTap: () => deleteUser(context),
              ),
              Text(
                "Delete User",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      color: Colors.red,
                      blurRadius: 10.0,
                      offset: Offset(-5.0, 5.0),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void logoutAll(BuildContext context) async {
    try {
      final provider = Provider.of<TaskProvider>(context, listen: false);
      await provider.logoutAll();
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } catch (e) {
      dialog(
        "Unable To logout",
        "Please try again",
      );
    }
  }

  void deleteUser(BuildContext context) async {
    try {
      final provider = Provider.of<TaskProvider>(context, listen: false);
      await provider.deleteUser();
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } catch (e) {
      dialog("User not Deleted", "Please try again");
    }
  }
}
//https://www.computerhope.com/issues/pictures/logout.jpg
//https://st2.depositphotos.com/4103319/6625/i/600/depositphotos_66251761-stock-photo-logout-circular-icon-on-white.jpg
// https://images.app.goo.gl/Q1tawrbuVtywtks28
// https://images.app.goo.gl/fzwdvc6G7YwR5MZT8