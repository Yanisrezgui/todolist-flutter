import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskPreview extends StatefulWidget {
  final Task task;

  TaskPreview({Key? key, required this.task}) : super(key: key);

  @override
  _TaskPreviewState createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  late Task _task;

  @override
  void initState() {
    _task = widget.task;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    if (_task.completed) {
      icon = Icons.check;
      color = Colors.green[100]!;
    } else {
      icon = Icons.close;
      color = Colors.red[100]!;
    }
    return ListTile(
      title: Text(_task.title ?? "No title"),
      subtitle: Text(_task.content),
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      trailing: Checkbox(
        value: _task.completed,
        onChanged: (bool? value) {
          if (value != null) {
            // Update the task's completed value and trigger a rebuild of the widget
            setState(() {
              _task.completed = value;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Task ${_task.title} is now ${_task.completed ? "completed" : "not completed"}"),
            ));
          }
        },
      ),
    );
  }
}
