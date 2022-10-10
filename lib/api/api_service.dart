import 'dart:convert';
import 'dart:developer';
import 'package:eduscan/api/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
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

  Future<RegistrarUsuarioResponse?> postRegistrar(String matricula, String email, String pswd, String rol) async {
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

}