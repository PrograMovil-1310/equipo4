import 'package:flutter/material.dart';
import 'package:equipo4/src/pages/home.dart';
import 'package:equipo4/src/pages/scanner.dart';
import 'package:equipo4/domain/entities/respuesta.dart';
import 'package:equipo4/helper/answer.dart';

class ResultScreen extends StatefulWidget {
  final String text;

  const ResultScreen({Key? key, required this.text}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

int _idCounter = 0;

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, dynamic>> results = [];
  final ApiAnswer _apiAnswer = ApiAnswer();

  @override
  void initState() {
    super.initState();
    _addResult(widget.text);
  }

  Future<void> _addResult(String text) async {
    var newResult = Respuesta(
      id: _idCounter.toString(),
      titulo: "Scan 1",
      descripcion: text,
    );
    await _apiAnswer.postRespuesta(newResult);
    setState(() {
      results.add(newResult.toJson());
      _idCounter++;
    });
  }

  Future<void> _editTitle(int index) async {
    TextEditingController _titleController = TextEditingController();
    _titleController.text = results[index]["titulo"] ?? "";

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Título'),
          content: TextField(
            controller: _titleController,
            decoration: const InputDecoration(hintText: 'Ingrese nuevo Título'),
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
              onPressed: () async {
                var updatedResult = Respuesta(
                  id: results[index]["id"],
                  titulo: _titleController.text,
                  descripcion: results[index]["descripcion"],
                );
                await _apiAnswer.postRespuesta(updatedResult);
                setState(() {
                  results[index] = updatedResult.toJson();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildResultsList() {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var result = results[index];
        return ExpansionTile(
          title: Text(result["titulo"] ?? "Untitled"),
          subtitle: Text(
            result["descripcion"]?.substring(0, 30) ?? "",
            overflow: TextOverflow.ellipsis,
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(result["descripcion"] ?? ""),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editTitle(index),
                ),
              ],
            )
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
      body: _buildResultsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
}
