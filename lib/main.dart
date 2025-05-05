import 'package:flutter/material.dart';

import 'ToDoPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'batch 10 flutter',
      home: ToDoPage(),
    );
  }
}

