import 'dart:convert';

RegistrarAlumnoRequest registrarAlumnoRequestFromJson(String str) => RegistrarAlumnoRequest.fromJson(json.decode(str));

String registrarAlumnoRequestToJson(RegistrarAlumnoRequest data) => json.encode(data.toJson());

class RegistrarAlumnoRequest {
  RegistrarAlumnoRequest({
    required this.matricula,
    required this.nombre,
    required this.apellidop,
    required this.apellidom,
    required this.estatus,
    required this.direccion,
    required this.nacimiento,
    required this.emailins,
    required this.emailper,
    required this.celular,
    required this.nss,
    required this.tiposangre,
    required this.grupo,
    required this.carrera,
    required this.cuatrimestre,
  });

  String matricula;
  String nombre;
  String apellidop;
  String apellidom;
  String estatus;
  String direccion;
  String nacimiento;
  String emailins;
  String emailper;
  String celular;
  String nss;
  String tiposangre;
  String grupo;
  String carrera;
  String cuatrimestre;

  factory RegistrarAlumnoRequest.fromJson(Map<String, dynamic> json) => RegistrarAlumnoRequest(
    matricula: json["matricula"],
    nombre: json["nombre"],
    apellidop: json["apellidop"],
    apellidom: json["apellidom"],
    estatus: json["estatus"],
    direccion: json["direccion"],
    nacimiento: json["nacimiento"],
    emailins: json["emailins"],
    emailper: json["emailper"],
    celular: json["celular"],
    nss: json["nss"],
    tiposangre: json["tiposangre"],
    grupo: json["grupo"],
    carrera: json["carrera"],
    cuatrimestre: json["cuatrimestre"],
  );

  Map<String, dynamic> toJson() => {
    "matricula": matricula,
    "nombre": nombre,
    "apellidop": apellidop,
    "apellidom": apellidom,
    "estatus": estatus,
    "direccion": direccion,
    "nacimiento": nacimiento,
    "emailins": emailins,
    "emailper": emailper,
    "celular": celular,
    "nss": nss,
    "tiposangre": tiposangre,
    "grupo": grupo,
    "carrera": carrera,
    "cuatrimestre": cuatrimestre,
  };
}
