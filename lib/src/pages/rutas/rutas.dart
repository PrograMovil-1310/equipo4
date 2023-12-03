
import 'package:flutter/material.dart';
import 'package:equipo4/src/pages/inventario.dart';
import 'package:equipo4/src/pages/acerca.dart';
import 'package:equipo4/src/pages/home.dart';
import 'package:equipo4/src/pages/scanner.dart';
import 'package:equipo4/src/pages/editar.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/home': (context) => Home(),
        '/scanner': (context) => Scanner(),
        '/inventario': (context) => Inventario(), 
        '/editar': (context) => Editar(),
        '/acerca de': (context) => Acerca(),
  };
}