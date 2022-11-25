import 'package:flutter/material.dart';

class SessionModel extends ChangeNotifier {
  late String matriculaSesion="";
  late String accesoSesion="";
  late int nivelSesion;
  void set(String matricula, String acceso, int nivel) {
    matriculaSesion=matricula;
    accesoSesion=acceso;
    nivelSesion=nivel;
    // Esta llamada dice a los widgets que están escuchando este modelo que se reconstruyan.
    notifyListeners();
  }
}