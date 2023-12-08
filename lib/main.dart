import 'package:flutter/material.dart';
import 'package:equipo4/src/pages/rutas/rutas.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: getRoutes(),
      initialRoute: '/login',
    );
  }
}
