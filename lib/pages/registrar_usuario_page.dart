import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrarUsuarioPage extends StatefulWidget {
  static String id = 'registrar_usuario_page';
  final String matricula, acceso;
  const RegistrarUsuarioPage({Key? key, required this.matricula, required this.acceso}) : super(key: key);
  @override
  State<RegistrarUsuarioPage> createState() => _RegistrarUsuarioPageState();
}

class _RegistrarUsuarioPageState extends State<RegistrarUsuarioPage> {
  final matriculaController = TextEditingController();
  final emailController = TextEditingController();
  final pswdController = TextEditingController();
  final pswdConfController = TextEditingController();
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
          child: TextField(
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
}
