import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:todolist/screens/task_form.dart';
import '../models/task.dart';
import '../screens/task_preview.dart';
import '../screens/task_details.dart';

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
    for (int i = 0; i <= 1; i++) {
      list.add(Task(
          id: i,
          content: Faker().lorem.sentence(),
          completed: Faker().randomGenerator.boolean(),
          title: Faker().lorem.sentence()));
    }
    return list;
  }

  void _addNewTask(Task newTask) {
    setState(() {
      _futureTasks.then((tasks) => tasks.add(newTask));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Task>>(
        future: _futureTasks,
        builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.hasData) {
            List<Task> tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                Task task = tasks[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetails(task: task),
                      ),
                    );
                  },
                  child: TaskPreview(task: task),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<Task>(
            context,
            MaterialPageRoute(builder: (context) => TaskForm()),
          ).then((newTask) {
            if (newTask != null) {
              _addNewTask(newTask);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('New task added!'),
                ),
              );
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
