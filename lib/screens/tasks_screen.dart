import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keep_tasks_frontend/provider/task_provider.dart';
import 'package:keep_tasks_frontend/widgets/add_task_sheet.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  bool done = false;
  bool taskLoaded = false;
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> _tasks = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.done == false) {
      fetch();
      widget.done = true;
    }
    super.didChangeDependencies();
  }

  void fetch() async {
    final provider = Provider.of<TaskProvider>(context);

    await provider.fetch();
    setState(() {
      _tasks.clear();
      _tasks = provider.tasks;
    });
    setState(() {
      widget.taskLoaded = true;
    });
    // print(_tasks);
  }

  void add(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddTaskSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: !widget.taskLoaded
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                backgroundColor: Colors.grey[400],
              ),
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                children: [
                  Card(
                    color: Colors.black.withAlpha(220),
                    elevation: 20,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          'Tasks',
                          style: TextStyle(
                            fontFamily: 'PressStart2P',
                            fontSize: 40,
                            color: Colors.blueGrey[200],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => TaskTile(_tasks[index]),
                      itemCount: _tasks.length,
                    ),
                  ),
                  Container(
                      child: Center(
                    child: IconButton(
                      tooltip: "Add a new task",
                      iconSize: 65,
                      hoverColor: Colors.red,
                      color: Colors.black,
                      onPressed: () => {
                        add(context),
                        setState(() {
                          widget.done = false;
                        })
                      },
                      icon: Icon(
                        Icons.add_circle_sharp,
                      ),
                    ),
                  )),
                ],
              ),
              color: Colors.blueGrey[50],
            ),
    );
  }
}
