import 'package:flutter/material.dart';
import './task.dart';

class ElephantApp extends StatefulWidget {
  const ElephantApp({super.key, required String title});

  @override
  _ElephantAppState createState() => _ElephantAppState();
}

class _ElephantAppState extends State<ElephantApp> {
  final List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      appBar: AppBar(title: const Center(child: Text('Elephant'))),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Elephant'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: Container(),
      ),
    );
  }
}
