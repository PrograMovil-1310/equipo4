import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('SCANDOC'),
          backgroundColor: Color.fromARGB(255, 238, 71, 0)),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://icones.pro/wp-content/uploads/2021/06/icone-fichier-document-orange.png',
              height: 250.0,
              width: 250.0,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16.0),
            Text(
              '¡Bienvenido a ScanDoc!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Capture, Convierta, Comparta – ScanDoc es su asistente digital',
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
            accountName: Text('MENU SCANDOC'),
            accountEmail: Text('scandoc@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://e.rpp-noticias.io/xlarge/2023/11/13/141114_1501572.webp',
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 71, 0),
            ),
          ),
          DrawerItem(
              icon: Icons.home,
              text: 'Inicio',
              onTap: () => Navigator.pushNamed(context, '/home')),
          DrawerItem(
              icon: Icons.document_scanner,
              text: 'Scanner',
              onTap: () => Navigator.pushNamed(context, '/scanner')),
          DrawerItem(
              icon: Icons.folder_open,
              text: 'Documentos',
              onTap: () => Navigator.pushNamed(context, '/documentos')),
          DrawerItem(
              icon: Icons.info,
              text: 'Acerca de',
              onTap: () => Navigator.pushNamed(context, '/acerca de')),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Salir'),
            onTap: () {
              //SystemNavigator.pop();
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
