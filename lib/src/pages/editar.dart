import 'package:flutter/material.dart';
import 'package:equipo4/src/pages/home.dart';

class Editar extends StatefulWidget {
  @override
  _EditarPageState createState() => _EditarPageState();
}

class _EditarPageState extends State<Editar> {
  List<Producto> productos = [
    Producto(id: 1, nombre: 'Producto 1', categoria: 'Electrónica', stock: 10, precioVenta: 20.0),
    Producto(id: 2, nombre: 'Producto 2', categoria: 'Ropa', stock: 15, precioVenta: 30.0),
    // agregar ejemplos
  ];

  String categoriaSeleccionada = 'Electrónica';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Inventario'),
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
                      subtitle: Text('ID Producto: ${producto.id} - Fecha Ingreso: ${producto.fechaIngreso}'),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Stock: ${producto.stock}'),
                          Text('Precio Venta: \$${producto.precioVenta.toStringAsFixed(2)}'),
                        ],
                      ),
                      onTap: () => _mostrarDetallesProducto(producto),
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

  void _mostrarDetallesProducto(Producto producto) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detalles del Producto'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('ID Producto: ${producto.id}'),
              Text('Fecha Ingreso: ${producto.fechaIngreso}'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _editarStock(producto),
                child: Text('Editar Cantidad de Stock'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _editarPrecioVenta(producto),
                child: Text('Editar Precio de Venta'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _editarStock(Producto producto) {
    // Implementar la lógica para editar la cantidad de stock aquí
  }

  void _editarPrecioVenta(Producto producto) {
    // Implementar la lógica para editar el precio de venta aquí
  }
}

class Producto {
  final int id;
  final String nombre;
  final String categoria;
  final int stock;
  final double precioVenta;
  final DateTime fechaIngreso;

  Producto({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.stock,
    required this.precioVenta,
  }) : fechaIngreso = DateTime.now(); // Fecha de ingreso es la fecha actual
}