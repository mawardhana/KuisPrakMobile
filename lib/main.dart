import 'package:flutter/material.dart';
import 'package:prakmobile_kuis_123200138/coffee_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '123200138',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CoffeeList(),
    );
  }
}
