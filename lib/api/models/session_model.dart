import 'package:flutter/material.dart';

class SessionModel extends ChangeNotifier {
  /// Estado privado de la matricula.
  late String matriculaSesion="";

  /// Estado privado del acceso.
  late String accesoSesion="";

  /// Añadir [item] al carro. Esta es la única manera de modificar el carrito desde fuera.
  void set(String matricula, String acceso) {
    matriculaSesion=matricula;
    accesoSesion=acceso;
    // Esta llamada dice a los widgets que están escuchando este modelo que se reconstruyan.
    notifyListeners();
  }
}