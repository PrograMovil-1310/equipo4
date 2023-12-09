import 'package:flutter/material.dart';
import 'package:equipo4/src/pages/home.dart';

class Acerca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de ScanDoc'),
        backgroundColor: Color.fromARGB(255, 238, 71, 0),
      ),
      drawer: MainDrawer(),
      body: Container(
        color: Colors.white, // Establecer el color de fondo
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Center(
                child: Image.network(
                  'https://icones.pro/wp-content/uploads/2021/06/icone-fichier-document-orange.png',
                  width: 250,
                  height: 250,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Agiliza la transformación de tus documentos con ScanDoc, la herramienta intuitiva que convierte cada escaneo en una experiencia digital eficiente y sin esfuerzo. Gestiona tus archivos con facilidad y da el salto al almacenamiento inteligente.',
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
                title: Text(
                    'Utiliza la cámara del dispositivo para escanear textos de documentos'),
              ),
              ListTile(
                leading: Icon(Icons.rocket_launch),
                title: Text('Captura datos de manera instantánea y precisa'),
              ),
              ListTile(
                leading: Icon(Icons.rocket_launch),
                title: Text(
                    'Permite a los usuarios editar el titulo del texto'),
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
