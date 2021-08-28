import 'package:flutter/material.dart';
import 'package:keep_tasks_frontend/models/task.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TaskProvider with ChangeNotifier {
  static const apiUrl = 'https://divi-keep-task-backend.herokuapp.com';
  List<Task> _tasks = [];
  String _authToken = '';
  // token getter
  String get authToken {
    return _authToken;
  }

  // signUser
  Future<void> signIn(String email, String password) async {
    String url = '${apiUrl}/users/login';
    var response;
    try {
      var userBody = json.encode({"email": email, "password": password});
      print(userBody);
      response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: userBody);
      final result = jsonDecode(response.body);

      if (result == {}) throw new Error();
      await saveToken(result['token']);
      print("signIn token >>> " + _authToken);
      notifyListeners();
    } catch (e) {
      print(e.toString());
      throw Error();
    }
  }

  //createUser

  // setToken
  Future<void> saveToken(newToken) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: 'jwt', value: newToken);
    this._authToken = newToken;
  }

  // getToken
  Future<void> getToken() async {
    final storage = new FlutterSecureStorage();
    var token = await storage.read(key: 'jwt');
    _authToken = token.toString();
  }

  // verifyToken
  Future<String> verifyToken() async {
    print("verify>>>" + this._authToken);
    String url = '${apiUrl}/users/verify';
    var response;
    try {
      response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer ${_authToken}'
        },
      );
      var result = json.decode(response.body);

      if (result.containsKey('error')) return "false";
    } catch (e) {
      return "false";
    }

    return "true";
  }

  // get all tasls
  List<Task> get tasks {
    return [..._tasks];
  }

  //fetch list
  Future<void> fetch() async {
    _tasks.clear();

    String url = '${apiUrl}/tasks';
    // var encoding = Encoding.getByName('utf-8');
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${_authToken}'
        },
      );
      final output = json.decode(response.body);

      for (final task in output) {
        _tasks.add(Task(description: task['description']));
      }
      notifyListeners();
    } catch (e) {}

    // var decoded = json.decode(response.body);
  }

  // add new task
  Future<void> addNewTask(String description) async {
    print(description);
    if (description.length == 0) return;
    String url = '${apiUrl}/tasks';
    try {
      var taskBody = json.encode({"description": description});
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${_authToken}'
          },
          body: taskBody);
      print(json.decode(response.body));
      Task task = new Task(description: description);
      _tasks.add(task);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    print('hello');
    final url = '${apiUrl}/users/logout';
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer ${_authToken}'
        },
      );
      // var result = json.decode(response.body);
      saveToken('');
      // if (result.containsKey('error')) throw new Error();
    } catch (e) {
      print(e);
      throw new Error();
    }
  }
}
