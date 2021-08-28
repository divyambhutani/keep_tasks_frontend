import 'package:flutter/material.dart';
import 'package:keep_tasks_frontend/provider/task_provider.dart';
import 'package:keep_tasks_frontend/screens/login_screen.dart';
import 'package:keep_tasks_frontend/screens/my_home_page_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class InitScreen extends StatefulWidget {
  bool verified = false;

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  bool isLoading = true;
  @override
  void initState() {
    // setState(() {
    //   isLoading = true;
    // });
    final provider = Provider.of<TaskProvider>(context, listen: false);
    getScreen(provider);
    // setState(() {
    //   isLoading = false;
    // });
    super.initState();
  }

  Future<void> getScreen(provider) async {
    setState(() {
      isLoading = true;
    });

    await provider.getToken();
    final verify = await provider.verifyToken();

    if (verify.toString() == "false") {
      setState(() {
        widget.verified = false;
      });
    } else {
      setState(() {
        widget.verified = true;
      });
    }
    // widget.verified == true
    //     ? Navigator.pushReplacementNamed(context, MyHomePage.routeName)
    //     : Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            backgroundColor: Colors.blueGrey,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
                backgroundColor: Colors.black,
              ),
            ),
          )
        : widget.verified
            ? MyHomePage()
            : LoginScreen();
  }
}
