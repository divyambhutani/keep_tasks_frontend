import 'package:flutter/material.dart';
import '../models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> _tasks = [
    Task(description: 'Task1', completed: false, createdAt: new DateTime.now()),
    Task(description: 'Task2', completed: true, createdAt: new DateTime.now()),
    Task(description: 'Task3', completed: false, createdAt: new DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Text(
              'TASKS',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: Text(_tasks[index].description),
                ),
                itemCount: _tasks.length,
              ),
            )
          ],
        ),
        color: Colors.blueGrey[50],
      ),
    );
  }
}
