import 'package:flutter/material.dart';
import 'package:keep_tasks_frontend/screens/init_screen.dart';
import 'package:keep_tasks_frontend/screens/my_home_page_screen.dart';
import 'provider/task_provider.dart';
import 'screens/init_screen.dart';
import 'screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'screens/log_out_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskProvider(),
      child: MaterialApp(
        // theme: ThemeData(
        //   brightness: Brightness.light,
        //   /* light theme settings */
        // ),
        // darkTheme: ThemeData(
        //   brightness: Brightness.dark,
        //   /* dark theme settings */
        // ),
        // themeMode: ThemeMode.dark,
        theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData().copyWith(
            thumbColor: MaterialStateProperty.all(Colors.black54),
          ),
        ),
        home: InitScreen(),
        routes: {
          MyHomePage.routeName: (context) => MyHomePage(),
          LoginScreen.routeName: (context) => LoginScreen(),
          LogOutScreen.routeName: (context) => LogOutScreen(),
        },
      ),
    );
  }
}
