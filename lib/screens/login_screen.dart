import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:keep_tasks_frontend/provider/task_provider.dart';
import 'package:provider/provider.dart';
import '../screens/my_home_page_screen.dart';
import '../screens/user_profile_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isLoading = false;

  Duration get loginTime => Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    Future<String>? dialog(String desc, String s) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('$s'),
          content: Text("$desc"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
                child: Text('OK!'))
          ],
        ),
      );
    }

    Future<String?> login(LoginData data) {
      return Future.delayed(loginTime).then((_) async {
        try {
          await provider.signIn(data.name, data.password);
        } catch (error) {
          print(error);
          setState(() {
            isLoading = true;
          });
          return await dialog(
              'Check your credentials', 'Password or email is wrong');
        }
      });
    }

    Future<String?> signup(LoginData data) {
      // ignore: missing_return
      return Future.delayed(loginTime).then((_) async {
        try {
          await provider.signUp(data.name, data.password);
        } catch (error) {
          print(error);
          setState(() {
            isLoading = true;
          });
          // print("signup");
          return await dialog(
              'Check your credentials', 'Password or email is wrong');
        }
      });
    }

    return FlutterLogin(
      // logo: 'assets/news_icon.png',
      onSubmitAnimationCompleted: () {
        // print(isLoading);
        if (isLoading == false) {
          Navigator.pushReplacementNamed(context, MyHomePage.routeName);
        }
      },
      // ignore: missing_return
      onLogin: (data) => login(data),

      onSignup: (data) => signup(data),
      onRecoverPassword: (String) => null,
      hideForgotPasswordButton: true,
      title: 'Goalz App',
      userType: LoginUserType.name,
      // onSignup: (data) => signup(data),
    );
  }
}
