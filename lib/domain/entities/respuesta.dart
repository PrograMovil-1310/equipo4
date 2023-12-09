import 'dart:convert';

Respuesta respuestaFromJson(String str) => Respuesta.fromJson(json.decode(str));

String respuestaToJson(Respuesta data) => json.encode(data.toJson());


class Respuesta {
  String id;
  String titulo;
  String descripcion;

  Respuesta({
    required this.id,
    required this.titulo,
    required this.descripcion,
  });

  factory Respuesta.fromJson(Map<String, dynamic> json) {
    return Respuesta(
     id: json["id"],
      titulo: json["titulo"],
      descripcion: json["descripcion"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
      };
}