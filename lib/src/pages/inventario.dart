import 'package:flutter/material.dart';
import 'package:equipo4/src/pages/home.dart';

class Inventario extends StatefulWidget {
  @override
  _InventarioPageState createState() => _InventarioPageState();
}

class _InventarioPageState extends State<Inventario> {
  List<Producto> productos = [
    Producto(id: 1, nombre: 'Producto 1', categoria: 'Electrónica', stock: 10, precioVenta: 20.0),
    Producto(id: 2, nombre: 'Producto 2', categoria: 'Ropa', stock: 15, precioVenta: 30.0),
    Producto(id: 3, nombre: 'Producto 3', categoria: 'Ropa', stock: 15, precioVenta: 30.0),
  ];

  String categoriaSeleccionada = 'Electrónica';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
        backgroundColor: Color.fromARGB(255, 167, 20, 20)
      ),
       drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: categoriaSeleccionada,
              onChanged: (String? newValue) {
                setState(() {
                  categoriaSeleccionada = newValue!;
                });
              },
              items: ['Electrónica', 'Ropa', 'Hogar'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Productos en la categoría: $categoriaSeleccionada', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  if (producto.categoria == categoriaSeleccionada) {
                    return ListTile(
                      title: Text(producto.nombre),
                      subtitle: Text('ID Producto: ${producto.id} - Stock: ${producto.stock} - Precio Venta: \$${producto.precioVenta.toStringAsFixed(2)}'),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Producto {
  final int id;
  final String nombre;
  final String categoria;
  final int stock;
  final double precioVenta;

  Producto({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.stock,
    required this.precioVenta,
  });
}