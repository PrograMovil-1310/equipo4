import 'package:equipo4/domain/entities/respuesta.dart';
import 'package:dio/dio.dart';

class ApiAnswer {
  final String url = "https://backend-proyectos-production.up.railway.app/nota";
  final _dio = Dio();

  Future<Respuesta> postRespuesta(Respuesta respuesta) async {
    final response = await _dio.post(url, data: respuesta.toJson());
    return Respuesta.fromJson(response.data);
  }

  Future<Respuesta> getRespuesta() async {
    final response = await _dio.get(url);
    final ApiAnswer = Respuesta.fromJson(response.data);
    return ApiAnswer;
  }
}
