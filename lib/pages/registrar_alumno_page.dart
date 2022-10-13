import 'package:eduscan/api/models/registrar_alumno_request_model.dart';
import 'package:eduscan/pages/qr_preview_page.dart';
import 'package:flutter/material.dart';

import '../api/api_service.dart';
import '../api/models/registrar_alumno_response_model.dart';
import '../api/models/registrar_usuario_response_model.dart';
import 'main_menu_page.dart';

class RegistrarAlumnoPage extends StatefulWidget {
  static String id = 'registrar_alumno_page';
  final String matricula, acceso;
  const RegistrarAlumnoPage({Key? key, required this.matricula, required this.acceso}) : super(key: key);
  @override
  State<RegistrarAlumnoPage> createState() => _RegistrarAlumnoPageState();
}

class _RegistrarAlumnoPageState extends State<RegistrarAlumnoPage> {
  final matriculaController = TextEditingController();
  final nombreController = TextEditingController();
  final apellidoPController = TextEditingController();
  final apellidoMController = TextEditingController();
  int holderEstatus=0;
  final direccionController = TextEditingController();
  final nacimientoController = TextEditingController();
  final correoIController = TextEditingController();
  final correoPController = TextEditingController();
  final celularController = TextEditingController();
  final nssController = TextEditingController();
  int holderSangre=0;
  final grupoController = TextEditingController();
  final carreraController = TextEditingController();
  final cuatrimestreController = TextEditingController();
  static const List<String> estatus = <String>['Activo', 'Baja Temporal', 'Egresado', 'En tramite'];
  static const List<String> sangre = <String>['A+', 'A-', 'B+', 'B-','AB+', 'AB-', 'O+', 'O-'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Matricula","Matricula",matriculaController),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Nombre","Nombre",nombreController),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Apellido Paterno","Apellido Paterno",apellidoPController),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Apellido Materno","Apellido Materno",apellidoMController),
                const SizedBox(
                  height: 15.0,
                ),
                _dropDownEstatus(),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Direccion","Direccion",direccionController),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Nacimiento","Nacimiento",nacimientoController),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Correo Institucional","Correo Institucional",correoIController),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Correo Personal","Correo Personal",correoPController),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Celular","Celular",celularController),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("NSS","NSS",nssController),
                const SizedBox(
                  height: 15.0,
                ),
                _dropDownSangre(),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Grupo","Grupo",grupoController),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Carrera","Carrera",carreraController),
                const SizedBox(
                  height: 15.0,
                ),
                _textField("Cuatrimestre","Cuatrimestre",cuatrimestreController),
                const SizedBox(
                  height: 15.0,
                ),
                _buttonRegistrar(),
              ],
            ),
          ),

        ),
      ),
    );
  }

  Widget _textField(String hint, String label, TextEditingController controller) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: const Icon(Icons.email),
              hintText: hint,
              labelText: label,
            ),
            controller: controller,
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _buttonRegistrar() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ElevatedButton(
              onPressed: () {
                _doRegistrar();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 10.0),
              child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                  child: const Text('Registrar')));
        });
  }

  Widget _dropDownSangre(){
    String dropdownValue = sangre.first;
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return DropdownButtonFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.account_box),
              enabledBorder: OutlineInputBorder( //<-- SEE HERE
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: OutlineInputBorder( //<-- SEE HERE
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              filled: true,
              labelText: 'Tipo de Sangre',
              //fillColor: Colors.greenAccent,
            ),
            dropdownColor: Colors.grey,
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                holderSangre=sangre.indexOf(newValue);
              });
            },
            items: sangre.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          );
        });
  }
  Widget _dropDownEstatus(){
    String dropdownValue = estatus.first;
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return DropdownButtonFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.account_box),
              enabledBorder: OutlineInputBorder( //<-- SEE HERE
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: OutlineInputBorder( //<-- SEE HERE
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              filled: true,
              labelText: 'Estatus',
              //fillColor: Colors.greenAccent,
            ),
            dropdownColor: Colors.grey,
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                holderEstatus=estatus.indexOf(newValue);
              });
            },
            items: estatus.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          );
        });
  }

  void _doRegistrar() async {
    RegistrarAlumnoRequest request = RegistrarAlumnoRequest(
        matricula: matriculaController.text, nombre: nombreController.text,
        apellidop: apellidoPController.text, apellidom: apellidoMController.text,
        estatus: holderEstatus.toString(), direccion: direccionController.text,
        nacimiento: nacimientoController.text, emailins: correoIController.text,
        emailper: correoPController.text, celular: celularController.text,
        nss: nssController.text, tiposangre: holderSangre.toString(),
        grupo: grupoController.text, carrera: carreraController.text,
        cuatrimestre: cuatrimestreController.text);
    RegistrarAlumnoResponse registrarAlumnoResponse = (await ApiService().postRegistrarAlumno(request))!;
    //Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (registrarAlumnoResponse.returnCode != 1&&
        registrarAlumnoResponse.sqlMessage.isNotEmpty) {
      _showDialogUnsuccesfull();
    } else {
      _showDialogSuccesfull(registrarAlumnoResponse.matricula);
    }
  }

  Future<void> _showDialogSuccesfull(String matriculaAlumno) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exito'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Usuario registrado correctamente'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QrPreviewPage(
                          matricula: widget.matricula, acceso: widget.acceso, matriculaAlumno: matriculaAlumno,),
                    ),
                        (e) => false);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogUnsuccesfull() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Error al registrar usuario'),
                Text('Favor de intentarlo mas tarde'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}