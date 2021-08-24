import 'package:flutter/material.dart';
import 'provider/task_provider.dart';
import 'screens/my_home_page_screen.dart';
import 'package:provider/provider.dart';

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
        home: MyHomePage(),
      ),
    );
  }
}
