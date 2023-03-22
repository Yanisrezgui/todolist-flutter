import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todolist/screens/task_master.dart';

class Elephant_App extends StatefulWidget {
  const Elephant_App({Key? key}) : super(key: key);
  @override
  _Elephant_AppState createState() => _Elephant_AppState();
}

class _Elephant_AppState extends State<Elephant_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elephant App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Elephant'),
        ),
        body: TasksMaster(),
      ),
    );
  }
}
