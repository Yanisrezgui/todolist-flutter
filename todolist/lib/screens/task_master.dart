import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import '../models/task.dart';
import '../screens/task_preview.dart';

class TasksMaster extends StatefulWidget {
  @override
  _TasksMasterState createState() => _TasksMasterState();
}

class _TasksMasterState extends State<TasksMaster> {
  late Future<List<Task>> _futureTasks;

  @override
  void initState() {
    super.initState();
    _futureTasks = _fetchTasks();
  }

  Future<List<Task>> _fetchTasks() async {
    List<Task> list = [];
    for (int i = 0; i <= 100; i++) {
      list.add(Task(
          id: i,
          content: Faker().lorem.sentence(),
          completed: Faker().randomGenerator.boolean(),
          title: Faker().lorem.sentence()));
    }
    return list;
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: _futureTasks,
      builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
        if (snapshot.hasData) {
          List<Task> tasks = snapshot.data!;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              Task task = tasks[index];
              return TaskPreview(task: task);
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
