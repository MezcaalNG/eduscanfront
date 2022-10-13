import 'dart:convert';

RegistrarUsuarioResponse registrarUsuarioResponseFromJson(String str) => RegistrarUsuarioResponse.fromJson(json.decode(str));
String registrarUsuarioResponseToJson(RegistrarUsuarioResponse data) => json.encode(data.toJson());

class RegistrarUsuarioResponse {
  RegistrarUsuarioResponse({
    required this.returnCode,
    required this.sqlCode,
    required this.sqlMessage,
  });

  int returnCode;
  String sqlCode;
  String sqlMessage;

  factory RegistrarUsuarioResponse.fromJson(Map<String, dynamic> json) =>
      RegistrarUsuarioResponse(
        returnCode: json["returnCode"],
        sqlCode: json["sqlCode"],
        sqlMessage: json["sqlMessage"],
      );

  Map<String, dynamic> toJson() =>
      {
        "returnCode": returnCode,
        "sqlCode": sqlCode,
        "sqlMessage": sqlMessage,
      };
}