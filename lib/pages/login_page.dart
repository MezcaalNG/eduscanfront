import 'package:flutter/material.dart';
import '../api/api_service.dart';
import '../api/models/loginResponseModel.dart';
import 'main_menu_page.dart';


class LoginPage extends StatefulWidget {
  static String id = 'login_page';

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
                child: Image.asset('images/logo.png',
                  height: 200.0,),
              ),
              SizedBox(height: 15.0,),
              _userTextField(),
              SizedBox(height: 15.0,),
              _passwordTextField(),
              SizedBox(height: 15.0,),
              _buttonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo Electronico',
            ),
            controller: emailController,
            onChanged: (value){

            },
          ),
        );
      },
    );
  }

  Widget _passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.password),
              hintText: 'Contraseña',
              labelText: 'Contraseña',
            ),
            controller: pswdController,
            onChanged: (value){

            },
          ),
        );
      },
    );
  }

  Widget _buttonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return ElevatedButton(
              onPressed: (){
                setState(() {
                  _doLogin(emailController.text,pswdController.text);
                });
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                  child: Text('Iniciar Sesion')
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 10.0
              )
          );
        }
    );
  }

  void _doLogin(String email, String pswd) async {
    LoginResponse _loginResponse = (await ApiService().postLogin(email,pswd))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_loginResponse.mensaje=="NOK"){
      _showDialogUnkownUser();
    }else{
      _navigate(_loginResponse.matricula,_loginResponse.acceso);
    }
  }

  void _navigate(String matricula, String acceso) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MainMenuPage(matricula: matricula, acceso: acceso),
        )
        , (e) => false);
  }

  Future<void> _showDialogUnkownUser() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Error al iniciar sesion'),
                Text('Favor de verificar usuario y contraseña'),
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
