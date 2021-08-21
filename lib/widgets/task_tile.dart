import 'package:flutter/material.dart';
import '../models/task.dart';
import '../constants/constants.dart';

class TaskTile extends StatelessWidget {
  late Task task;
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)],
      // ),
      // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Card(
        color: Colors.blueGrey[500],
        elevation: 20,
        child: ListTile(
          onTap: null,
          title: Text(
            task.description,
            overflow: TextOverflow.ellipsis,
            style: TaskTileTextStyle,
          ),
          trailing: task.completed
              ? Icon(
                  Icons.circle_rounded,
                  color: Color.fromRGBO(37, 211, 102, 1),
                )
              : Icon(
                  Icons.circle_rounded,
                  color: Colors.red,
                ),
          subtitle: Text(
            task.createdAt.toIso8601String(),
            style: TaskTileTextStyle,
          ),
        ),
      ),
    );
  }
}
