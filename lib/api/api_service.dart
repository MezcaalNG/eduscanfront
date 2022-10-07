import 'dart:convert';
import 'dart:developer';

import 'package:eduscan/api/models/loginResponseModel.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';


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
        LoginResponse _loginResponse = loginResponseFromJson(response.body);
        return _loginResponse;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}