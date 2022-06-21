import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'widgets/container_box.dart';
import 'widgets/data_container.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainScreen());
  }
}
