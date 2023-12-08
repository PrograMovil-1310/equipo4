import 'package:flutter/material.dart';
import 'package:equipo4/src/pages/home.dart';

class Documentos extends StatefulWidget {
  final String text;

  const Documentos({Key? key, required this.text}) : super(key: key);

  @override
  _DocumentosState createState() => _DocumentosState ();
}

class _DocumentosState  extends State<Documentos> {
  List<Map<String, String>> results = [];

  @override
  void initState() {
    super.initState();
    results.add({"titulo": "Scan 1", "text": widget.text});
  }

  Future<void> _editTitle(int index) async {
    TextEditingController _titleController = TextEditingController();
    _titleController.text = results[index]["titulo"] ?? "";

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Titulo'),
          content: TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Ingrese nuevo Titulo',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Guardar'),
              onPressed: () {
                setState(() {
                  results[index]["titulo"] = _titleController.text;
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
        title: const Text('Documentos Escaneados'),
        backgroundColor: Color.fromARGB(255, 167, 20, 20),
      ),
       drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          var result = results[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Card(
              child: ListTile(
                title: Text(result["titulo"] ?? "Untitled"),
                subtitle: Text(result["text"] ?? ""),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editTitle(index),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Agregar lógica para escanear más texto y añadirlo a los resultados
          Home();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}