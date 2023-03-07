import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import '../models/task.dart';

class TasksMaster extends StatefulWidget {
  const TasksMaster({Key? key}) : super(key: key);

  @override
  _TasksMasterState createState() => _TasksMasterState();
}

class _TasksMasterState extends State<TasksMaster> {
  Future<List<Task>> _fetchTasks() async {
    List<Task> tasks = [];
    for (int i = 0; i < 100; i++) {
      Task task = Task(
        id: i,
        content: faker.lorem.sentence(),
        completed: false,
        title: 'Task $i',
      );
      tasks.add(task);
    }
    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchTasks(),
      builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              Task task = snapshot.data![index];
              return ListTile(
                title: Text(task.title ?? ""),
                subtitle: Text(task.content),
                trailing: Checkbox(
                  value: task.completed,
                  onChanged: (value) {
                    setState(() {
                      task.completed = value!;
                    });
                  },
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
