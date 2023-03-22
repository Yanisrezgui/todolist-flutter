import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todolist/screens/task_form.dart';
import 'package:todolist/screens/task_preview.dart';

import '../models/task.dart';
import '../providers/tasks_provider.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({super.key});
  @override
  _TasksMasterState createState() => _TasksMasterState();
}

class _TasksMasterState extends State<TasksMaster> {
  void _navigateToTaskForm(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskForm()),
      // MaterialPageRoute(builder: (context) => TaskForm(addTask: _addTask)),
    );
    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nouvelle tâche ajoutée!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TasksProvider>(
        builder: (context, tasksProvider, child) {
          List<Task> tasks = tasksProvider.tasks;
          return Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                Task task = tasks[index];
                return TaskPreview(task: task);
              },
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          onPressed: () {
            _navigateToTaskForm(context);
          },
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
