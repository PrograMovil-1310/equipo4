
import 'package:flutter/material.dart';
import 'package:equipo4/src/pages/documentos.dart';
import 'package:equipo4/src/pages/acerca.dart';
import 'package:equipo4/src/pages/home.dart';
import 'package:equipo4/src/pages/login.dart';
import 'package:equipo4/src/pages/scanner.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/login': (context) => LoginScreen(),
    '/home': (context) => Home(),
        '/scanner': (context) => Scanner(),
        '/documentos': (context) => Documentos(), 
        '/acerca de': (context) => Acerca(),
  };
}