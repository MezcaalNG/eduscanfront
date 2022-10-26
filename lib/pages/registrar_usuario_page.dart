import 'package:eduscan/api/models/registrar_usuario_response_model.dart';
import 'package:flutter/material.dart';

import '../api/api_service.dart';
import 'main_menu_page.dart';

class RegistrarUsuarioPage extends StatefulWidget {
  static String id = 'registrar_usuario_page';
  const RegistrarUsuarioPage({Key? key}) : super(key: key);
  @override
  State<RegistrarUsuarioPage> createState() => _RegistrarUsuarioPageState();
}

class _RegistrarUsuarioPageState extends State<RegistrarUsuarioPage> {
  final matriculaController = TextEditingController();
  final emailController = TextEditingController();
  final pswdController = TextEditingController();
  final pswdConfController = TextEditingController();
  int holderDrop=0;
  static const List<String> roles = <String>['Alumno', 'Guardia', 'Docente', 'Administrativo'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              _textField("00000000","Matricula",matriculaController),
              const SizedBox(
                height: 15.0,
              ),
              _textField("ejemplo@correo.com","Correo Electronico",emailController),
              const SizedBox(
                height: 15.0,
              ),
              _passwordField("Contraseña","Contraseña",pswdController),
              const SizedBox(
                height: 15.0,
              ),
              _passwordField("Contraseña","Confirmar Contraseña",pswdConfController),
              const SizedBox(
                height: 15.0,
              ),
              _dropDownRol(),
              const SizedBox(
                height: 15.0,
              ),
              _buttonRegistrar(),
            ],
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

  Widget _passwordField(String hint, String label, TextEditingController controller) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration:  InputDecoration(
              icon: const Icon(Icons.password),
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

  Widget _dropDownRol(){
    String dropdownValue = roles.first;
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
              labelText: 'Rol',
              //fillColor: Colors.greenAccent,
            ),
            dropdownColor: Colors.grey,
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                holderDrop=roles.indexOf(newValue);
              });
            },
            items: roles.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          );
        });
  }

  void _doRegistrar() async {
    String matricula=matriculaController.text;
    String email=emailController.text;
    String pswd=pswdController.text;
    String pswdConf=pswdConfController.text;
    String rol=holderDrop.toString();
    RegistrarUsuarioResponse registrarUsuarioResponse = (await ApiService().postRegistrarUsuario(matricula,email,pswd,rol))!;
    //Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (registrarUsuarioResponse.returnCode != 1&&
        registrarUsuarioResponse.sqlMessage.isNotEmpty) {
      _showDialogUnsuccesfull();
    } else {
      _showDialogSuccesfull();
    }
  }

  Future<void> _showDialogSuccesfull() async {
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
                      builder: (context) => const MainMenuPage(),
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
