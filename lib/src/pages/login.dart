import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController(text: 'admin123');
  final TextEditingController _passwordController = TextEditingController(text: '123');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 167, 20, 20)!, // Ocre color
              Colors.orange[400]!, // Mostaza color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white24,
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.white, // Icono de persona blanco
              ),
            ),
            SizedBox(height: 48),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Usuario',
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: <Widget>[
                Checkbox(
                  value: true,
                  activeColor: Color.fromARGB(255, 226, 234, 0),
                  onChanged: (bool? value) {
                    // Handle remember me checkbox
                  },
                ),
                Text('Recuérdame', style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('Ingresar'),
              onPressed: () {
                // Implementa la lógica de navegación
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Color de fondo
                onPrimary: Colors.black, // Color del texto
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
