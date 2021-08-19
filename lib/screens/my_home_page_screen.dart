import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import './tasks_screen.dart';
import 'dart:math' as math show pi;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  String _headline = '';
  NetworkImage _avatarImg =
      NetworkImage('https://www.w3schools.com/howto/img_avatar.png');
  late Widget mainBody;
  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    mainBody = TasksScreen();
    _headline = _items.firstWhere((item) => item.isSelected).text;
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
        text: 'Stats',
        icon: Icons.assessment,
        onPressed: () => setState(() => mainBody = Helper()),
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.account_circle,
        onPressed: () => setState(() => _headline = 'Settings'),
      ),
      // CollapsibleItem(
      //   text: 'Search',
      //   icon: Icons.search,
      //   onPressed: () => setState(() => mainBody = Helper2()),
      // ),
      CollapsibleItem(
        text: 'LogOut',
        icon: Icons.logout_rounded,
        onPressed: () => setState(() => mainBody = Helper1()),
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

        title: 'User',
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

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.23),
            child: Helper(),
          ),
        ),
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
