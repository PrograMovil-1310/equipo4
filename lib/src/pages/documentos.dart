import 'package:flutter/material.dart';
import 'package:equipo4/src/pages/home.dart';
import 'package:equipo4/src/pages/scanner.dart';

class ResultScreen extends StatefulWidget {
  final String text;

  const ResultScreen({Key? key, required this.text}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

int _idCounter = 0;

class _ResultScreenState extends State<ResultScreen> {
  // Lista para almacenar los resultados con un ID único para cada entrada.
  List<Map<String, dynamic>> results = [];

  @override
  void initState() {
    super.initState();
    // Añade el resultado inicial a la lista con un ID generado.
    results.add({
      "id": _idCounter++, // Incrementa el contador de ID.
      "title": "Scan 1",
      "text": widget.text
    });
  }

  // Método para editar el título de un resultado.
  Future<void> _editTitle(int index) async {
    // Controlador para el campo de texto del diálogo de edición.
    TextEditingController _titleController = TextEditingController();
    _titleController.text = results[index]["title"] ?? "";

    // Mostrar el diálogo de edición.
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Titulo'),
          content: TextField(
            controller: _titleController,
            decoration: const InputDecoration(hintText: 'Ingrese nuevo Titulo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Guardar'),
              onPressed: () {
                // Actualizar el título con el nuevo valor.
                setState(() {
                  results[index]["title"] = _titleController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Textos Escaneados'),
        backgroundColor: Color.fromARGB(255, 238, 71, 0),
      ),
      drawer: MainDrawer(),
      body: _buildResultsList(), // Construye la lista de resultados.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para agregar nuevos escaneos.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Scanner()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 238, 186, 0),
      ),
    );
  }

  // Método para construir la lista de resultados con la capacidad de expandir y ver el texto completo.
  Widget _buildResultsList() {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var result = results[index];
        return ExpansionTile(
          title: Text(result["title"] ?? "Untitled"),
          subtitle: Text(
            result["text"]?.substring(0, 30) ?? "",
            overflow: TextOverflow.ellipsis,
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(result["text"] ?? ""),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editTitle(
                      index), // Llama al método de edición de título.
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
