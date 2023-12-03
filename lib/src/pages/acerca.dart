import 'package:flutter/material.dart';
import 'package:equipo4/src/pages/home.dart';

class Acerca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de QR Inventory'),
        backgroundColor: Color.fromARGB(255, 167, 20, 20)
      ),  drawer: MainDrawer(),
      body: Container(
  color: Colors.white, // Establecer el color de fondo
  child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
             child: Image.asset(
             'assets/logo.jpg', 
              width: 250,
             height: 250,
               ),
            ),
            SizedBox(height: 5),
            Text(
              '',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Simplifica la gestión de tus productos con una herramienta intuitiva y rápida, convirtiendo cada escaneo de código QR en una experiencia de inventario eficiente y sin complicaciones.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Características:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.rocket_launch),
              title: Text('Utiliza la cámara del dispositivo para escanear códigos QR en productos'),
            ),
            ListTile(
              leading: Icon(Icons.rocket_launch),
              title: Text('Captura datos de manera instantánea y precisa'),
            ),
            ListTile(
              leading: Icon(Icons.rocket_launch),
              title: Text('Permite a los usuarios editar información de productos'),
            ),
            ListTile(
              leading: Icon(Icons.rocket_launch),
              title: Text('Cuenta con una interfaz amigable y fácil de usar'),
            ),
            
          ],
        ),
      ),
        ),
    );
  }
}