import 'dart:convert';

RegistrarAlumnoResponse registrarAlumnoResponseFromJson(String str) => RegistrarAlumnoResponse.fromJson(json.decode(str));

String registrarAlumnoResponseToJson(RegistrarAlumnoResponse data) => json.encode(data.toJson());

class RegistrarAlumnoResponse {
  RegistrarAlumnoResponse({
    required this.matricula,
    required this.sqlCode,
    required this.sqlMessage,
    required this.returnCode,
  });

  String matricula;
  String sqlCode;
  String sqlMessage;
  int returnCode;

  factory RegistrarAlumnoResponse.fromJson(Map<String, dynamic> json) => RegistrarAlumnoResponse(
    matricula: json["matricula"],
    sqlCode: json["sqlCode"],
    sqlMessage: json["sqlMessage"],
    returnCode: json["returnCode"],
  );

  Map<String, dynamic> toJson() => {
    "matricula": matricula,
    "sqlCode": sqlCode,
    "sqlMessage": sqlMessage,
    "returnCode": returnCode,
  };
}
