import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  var isloading = false;

  Duration get loginTime => Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
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
              ));
    }

    Future<String>? login(LoginData data) {
      // ignore: missing_return
    }

    Future<String>? signup(LoginData data) {
      // ignore: missing_return
    }

    return FlutterLogin(
      // logo: 'assets/news_icon.png',
      onSubmitAnimationCompleted: () {
        print(isloading);
        // Navigator.pushReplacementNamed(context);
      },
      // ignore: missing_return
      onLogin: (data) => login(data),

      onSignup: (LoginData) {}, onRecoverPassword: (String) {},
      // onSignup: (data) => signup(data),
    );
  }
}
