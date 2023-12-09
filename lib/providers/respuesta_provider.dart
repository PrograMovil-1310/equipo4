import 'package:flutter/material.dart';
import 'package:equipo4/domain/entities/respuesta.dart';
import 'package:equipo4/helper/answer.dart';

class RespuestaProvider extends ChangeNotifier {
  final _ApiAnswer = ApiAnswer();
  Respuesta mensaje = Respuesta(id: ' ', titulo: ' ', descripcion: ' ');

  Future<void> loadRespuesta() async{
    await Future.delayed(const Duration(milliseconds: 5000));
    mensaje = await _ApiAnswer.getRespuesta();
    notifyListeners();
  }
}