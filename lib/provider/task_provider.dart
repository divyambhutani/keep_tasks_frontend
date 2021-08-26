import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keep_tasks_frontend/models/task.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  // get all tasls
  List<Task> get tasks {
    return [..._tasks];
  }

  //fetch list
  Future<void> fetch() async {
    _tasks.clear();
    print('Invoked1');

    String url = 'https://divi-keep-task-backend.herokuapp.com/tasks';
    // var encoding = Encoding.getByName('utf-8');
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MTI2NDY0MGI3Yjg5ZTAwMTZjN2Y5YTUiLCJpYXQiOjE2Mjk4OTgzMDR9.iJBUM6SqRFw3cP8SjukkYLCSyzEAypNgx7PPpSjuxZ8"
        },
      );
      final output = json.decode(response.body);

      for (final task in output) {
        _tasks.add(Task(description: task['description']));
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
    print('Invoked2');

    // var decoded = json.decode(response.body);
  }

  // add new task
  Future<void> addNewTask(String description) async {
    print(description);
    if (description.length == 0) return;
    String url = 'https://divi-keep-task-backend.herokuapp.com/tasks';
    try {
      var taskBody = json.encode({"description": description});
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization':
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MTI2NDY0MGI3Yjg5ZTAwMTZjN2Y5YTUiLCJpYXQiOjE2Mjk4OTgzMDR9.iJBUM6SqRFw3cP8SjukkYLCSyzEAypNgx7PPpSjuxZ8"
          },
          body: taskBody);
      print(json.decode(response.body));
      Task task = new Task(description: description);
      _tasks.add(task);
      notifyListeners();
    } catch (e) {}
  }
}
