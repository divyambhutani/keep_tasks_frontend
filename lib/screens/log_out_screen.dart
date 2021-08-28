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
      print('here-1');
      final provider = Provider.of<TaskProvider>(context, listen: false);
      await provider.logout();
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } catch (e) {
      dialog("Unable To logout", "Please try again");
    }
  }

  void onPress(context) {
    logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.logout_rounded),
        onPressed: () => onPress(context),
      ),
    );
  }
}
