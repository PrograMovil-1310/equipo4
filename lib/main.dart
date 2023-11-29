import 'package:flutter_proyecto/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto/pages/home.dart';

void main() {
  //setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}