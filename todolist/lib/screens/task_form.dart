import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../providers/tasks_provider.dart';

class TaskForm extends StatefulWidget {
  // final Function addTask;

  // TaskForm({required this.addTask});

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Task task = Task(
        title: _titleController.text,
        content: _contentController.text,
        completed: false,
      );
      context.read<TasksProvider>().addTask(task);
      // widget.addTask(task);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Nouvelle tâche ajoutée!'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouvelle tâche'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Titre'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir un titre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
