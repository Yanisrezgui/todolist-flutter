import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/screens/task_details.dart';

import '../models/task.dart';
import '../providers/tasks_provider.dart';

class TaskPreview extends StatefulWidget {
  final Task task;

  const TaskPreview({required this.task});

  @override
  _TaskPreviewState createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  late TasksProvider _tasksProvider;

  @override
  void initState() {
    super.initState();
    _tasksProvider = Provider.of<TasksProvider>(context, listen: false);
  }

  void _navigateToTaskDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskDetails(task: widget.task)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color tileColor = widget.task.completed ? Colors.green : Colors.red;
    return ListTile(
      title: Text(widget.task.title ?? "No title"),
      subtitle: Text(widget.task.content),
      trailing: Checkbox(
        value: widget.task.completed,
        onChanged: (bool? value) {
          setState(() {
            _tasksProvider.updateTask(widget.task);
            widget.task.toggleCompleted();
          });
        },
      ),
      tileColor: tileColor,
      onTap: () => _navigateToTaskDetails(context),
    );
  }
}
