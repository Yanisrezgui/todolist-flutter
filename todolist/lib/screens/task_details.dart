import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskDetails extends StatefulWidget {
  final Task task;

  TaskDetails({Key? key, required this.task}) : super(key: key);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  late Task _task;

  @override
  void initState() {
    _task = widget.task;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
      ),
      body: Form(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _task.title,
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
                onChanged: (value) {
                  setState(() {
                    _task.title = value;
                  });
                },
                maxLines: null,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                initialValue: _task.content,
                decoration: const InputDecoration(
                  labelText: "Content",
                ),
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
