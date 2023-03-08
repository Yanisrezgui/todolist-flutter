import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskPreview extends StatelessWidget {
  final Task task;

  TaskPreview({required this.task});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    if (task.completed) {
      icon = Icons.check;
      color = Colors.green[100]!;
    } else {
      icon = Icons.close;
      color = Colors.red[100]!;
    }
    return ListTile(
      title: Text(task.title ?? "No title"),
      subtitle: Text(task.content),
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      trailing: Checkbox(
        value: task.completed,
        onChanged: (bool? value) {
          // Update the task's completed value and trigger a rebuild of the widget
          task.completed = value!;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Task ${task.title} is now ${task.completed ? "completed" : "not completed"}"),
          ));
        },
      ),
    );
  }
}
