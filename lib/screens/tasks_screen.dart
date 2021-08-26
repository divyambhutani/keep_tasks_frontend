import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keep_tasks_frontend/provider/task_provider.dart';
import 'package:keep_tasks_frontend/widgets/addTaskSheet.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> _tasks = [];
  @override
  void initState() {
    fetch();
    super.initState();
  }

  void fetch() async {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    await provider.fetch();
    _tasks = await provider.tasks;
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
      child: Container(
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
                color: Colors.blue,
                onPressed: () => {add(context)},
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
