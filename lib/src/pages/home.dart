import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('QR Inventory'),
          backgroundColor: Color.fromARGB(255, 167, 20, 20)),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.jpg',
              height: 200.0,
              width: 200.0,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16.0),
            Text(
              '¡Bienvenido a QR Inventory!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Gestiona tu inventario con facilidad y rapidez, todo a través de un simple escaneo con QR Inventory',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Home();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('MENU QR INVENTORY'),
            accountEmail: Text('qrinventory@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/logo.jpg'),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 167, 20, 20),
            ),
          ),
          DrawerItem(
              icon: Icons.home,
              text: 'Inicio',
              onTap: () => Navigator.pushNamed(context, '/home')),
          DrawerItem(
              icon: Icons.qr_code_scanner,
              text: 'Scanner',
              onTap: () => Navigator.pushNamed(context, '/scanner')),
          DrawerItem(
              icon: Icons.inventory,
              text: 'Inventario',
              onTap: () => Navigator.pushNamed(context, '/inventario')),
          DrawerItem(
              icon: Icons.draw,
              text: 'Editar',
              onTap: () => Navigator.pushNamed(context, '/editar')),
          DrawerItem(
              icon: Icons.info,
              text: 'Acerca de',
              onTap: () => Navigator.pushNamed(context, '/acerca de')),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Salir'),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends ListTile {
  DrawerItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap})
      : super(
          leading: Icon(icon),
          title: Text(text),
          onTap: onTap,
        );
}
