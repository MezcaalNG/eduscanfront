import 'package:eduscan/api/models/session_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../api/api_service.dart';
import '../api/models/login_response_model.dart';
import 'main_menu_page.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final pswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'images/logo.png',
                  height: 200.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              _userTextField(),
              const SizedBox(
                height: 15.0,
              ),
              _passwordTextField(),
              const SizedBox(
                height: 15.0,
              ),
              _buttonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              icon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'ejemplo@correo.com',
              labelText: 'CORREO ELECTRONICO',
              hintStyle: TextStyle(color: Colors.white, letterSpacing: .5),
              labelStyle: TextStyle(color: Colors.white, letterSpacing: .5),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))
            ),
            style: GoogleFonts.lato(
              textStyle:
                  const TextStyle(color: Colors.white, letterSpacing: .5),
            ),
            controller: emailController,
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: const InputDecoration(
              icon: Icon(
                Icons.password,
                color: Colors.white,
              ),
              hintText: 'CONTRASEÑA',
              labelText: 'CONTRASEÑA',
              hintStyle: TextStyle(color: Colors.white, letterSpacing: .5),
              labelStyle: TextStyle(color: Colors.white, letterSpacing: .5),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))
            ),
            style: GoogleFonts.lato(
              textStyle:
                  const TextStyle(color: Colors.white, letterSpacing: .5),
            ),
            controller: pswdController,
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _buttonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _doLogin(emailController.text, pswdController.text);
            });
          },
          icon: const Icon(Icons.login),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: const Color(0xFF8CC63F),
              foregroundColor: const Color(0xFF002E5D),
              elevation: 10.0),
          label: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
              child: const Text('INICIAR SESION')));
    });
  }

  void _doLogin(String email, String pswd) async {
    var session = context.read<SessionModel>();
    LoginResponse loginResponse = (await ApiService().postLogin(email, pswd))!;
    if (loginResponse.mensaje == "NOK") {
      _showDialogUnkownUser();
    } else {
      session.set(
          loginResponse.matricula, loginResponse.acceso, loginResponse.nivel);
      _navigate();
    }
  }

  void _navigate() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainMenuPage(),
        ),
        (e) => false);
  }

  Future<void> _showDialogUnkownUser() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('UPS!!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('HA OCURRIDO UN ERROR AL INICIAR SESION'),
                Text('POR FAVOR VERIFICA TU USUARIO Y CONTRASEÑA'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ACEPTAR'),
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
