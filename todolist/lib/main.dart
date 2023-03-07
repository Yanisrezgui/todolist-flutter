import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './elephant_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elephant Demo',
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: const ElephantApp(title: "elephant app"),
    );
  }
}
