import 'package:flutter/material.dart';
import 'package:keep_tasks_frontend/provider/task_provider.dart';
import 'package:keep_tasks_frontend/screens/login_screen.dart';
import 'package:keep_tasks_frontend/screens/my_home_page_screen.dart';
import 'package:provider/provider.dart';

class InitScreen extends StatefulWidget {
  bool verified = false;

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  bool isLoading = true;
  void initState() {
    setState(() {
      isLoading = true;
    });
    getScreen();
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  Future<void> getScreen() async {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    await provider.getToken();
    final verify = await provider.verifyToken();
    print(verify.toString());
    if (verify.toString() == "false") {
      setState(() {
        widget.verified = false;
      });
    } else {
      setState(() {
        widget.verified = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? widget.verified == true
            ? MyHomePage()
            : LoginScreen()
        : Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          );
  }
}

/******************************************************** */
// class InitScreen extends StatefulWidget {

//   @override
//   _InitScreenState createState() => _InitScreenState();
// }

// class _InitScreenState extends State<InitScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return isLoading == false
//         ? widget.verified == true
//             ? MyHomePage()
//             : LoginScreen()
//         : Center(
//             child: CircularProgressIndicator(
//               color: Colors.orange,
//             ),
//           );
//   }
// }
