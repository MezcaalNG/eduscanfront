import 'dart:convert';
import 'dart:developer';
import 'package:eduscan/api/models/login_response_model.dart';
import 'package:eduscan/api/models/registrar_alumno_request_model.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'models/registrar_alumno_response_model.dart';
import 'models/registrar_usuario_response_model.dart';


class ApiService {

  Future<LoginResponse?> postLogin(String email, String pswd) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndPoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'password': pswd,
          })
      );
      if (response.statusCode == 200) {
        LoginResponse loginResponse = loginResponseFromJson(response.body);
        return loginResponse;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<RegistrarUsuarioResponse?> postRegistrarUsuario(String matricula, String email, String pswd, String rol) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registrarUsuarioEndPoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'matricula': matricula,
            'email': email,
            'pswd': pswd,
            'acceso': rol,
          })
      );
      if (response.statusCode == 200) {
        RegistrarUsuarioResponse registrarResponse = registrarUsuarioResponseFromJson(response.body);
        return registrarResponse;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<RegistrarAlumnoResponse?> postRegistrarAlumno(RegistrarAlumnoRequest request) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registrarAlumnoEndPoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'matricula':request.matricula,
            'nombre':request.nombre,
            'apellidop':request.apellidop,
            'apellidom':request.apellidom,
            'estatus':request.estatus,
            'direccion':request.direccion,
            'nacimiento':request.nacimiento,
            'emailins':request.emailins,
            'emailper':request.emailper,
            'celular':request.celular,
            'nss':request.nss,
            'tiposangre':request.tiposangre,
            'grupo':request.grupo,
            'carrera':request.carrera,
            'cuatrimestre':request.cuatrimestre
          })
      );
      if (response.statusCode == 200) {
        RegistrarAlumnoResponse registrarResponse = registrarAlumnoResponseFromJson(response.body);
        return registrarResponse;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<RegistrarAlumnoRequest?> postConsultaAlumno(String matricula) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.consultarAlumnoEndPoint);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'matricula': matricula
          })
      );
      if (response.statusCode == 200) {
        RegistrarAlumnoRequest responseConsulta = registrarAlumnoRequestFromJson(response.body);
        return responseConsulta;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}