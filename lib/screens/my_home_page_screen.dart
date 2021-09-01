import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:keep_tasks_frontend/screens/init_screen.dart';
import 'package:keep_tasks_frontend/screens/user_profile_screen.dart';
import 'log_out_screen.dart';
import './tasks_screen.dart';
import 'dart:math' as math show pi;
import 'package:provider/provider.dart';
import '../provider/task_provider.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/MyHomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String meName = '';

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // final provider = Provider.of<TaskProvider>(context, listen: false);
    setUserName();
    super.initState();
  }

  void setUserName() async {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    await provider.getUserDetails();
    setState(() {
      meName = provider.me.username;
    });
  }

  @override
  List<CollapsibleItem> _items = [];
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SidebarPage(),
      ),
    );
  }
}

class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  List<CollapsibleItem> _items = [];

  NetworkImage _avatarImg =
      NetworkImage('https://www.w3schools.com/howto/img_avatar.png');
  late Widget mainBody;
  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    mainBody = TasksScreen();
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Home',
        icon: Icons.task_alt_rounded,
        onPressed: () => setState(() => mainBody = TasksScreen()),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Profile',
        icon: Icons.account_circle,
        onPressed: () => setState(() => mainBody = UserProfileScreen()),
      ),
      CollapsibleItem(
        text: 'LogOut',
        icon: Icons.logout_rounded,
        onPressed: () => setState(() => mainBody = LogOutScreen()),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        items: _items,
        // fitItemsToBottom: true,
        avatarImg: _avatarImg,

        title: meName,
        onTitleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
        },
        body: mainBody,
        backgroundColor: Colors.black,
        selectedTextColor: Colors.limeAccent,
        textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Helper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Hello"),
    );
  }
}

class Helper1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Hello1"),
    );
  }
}

class Helper2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Hello2"),
    );
  }
}
