import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.matricula,
    required this.nivel,
    required this.acceso,
    required this.mensaje,
  });

  String matricula;
  int nivel;
  String acceso;
  String mensaje;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    matricula: json["matricula"],
    nivel: json["nivel"],
    acceso: json["acceso"],
    mensaje: json["mensaje"],
  );

  Map<String, dynamic> toJson() => {
    "matricula": matricula,
    "nivel": nivel,
    "acceso": acceso,
    "mensaje": mensaje,
  };
}