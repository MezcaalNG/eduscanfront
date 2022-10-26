import 'package:eduscan/api/models/session_model.dart';
import 'package:eduscan/pages/registrar_alumno_page.dart';
import 'package:eduscan/pages/registrar_usuario_page.dart';
import 'package:eduscan/pages/scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainMenuPage extends StatefulWidget {
  static String id = 'main_menu_page';
  const MainMenuPage({Key? key})
      : super(key: key);
  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('EduScan'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SizedBox(height: 15.0,),
              _cardDatosUsuario(),
              const SizedBox(
                height: 15.0,
              ),
              _button("Registrar Usuario", _navigateRegistroUsuario),
              const SizedBox(
                height: 15.0,
              ),
              _button("Registrar Alumno", _navigateRegistroAlumno),
              const SizedBox(
                height: 15.0,
              ),
              _button("Escanear Codigo", _navigateScanner),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(String text, void Function() onPressAction) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          onPressed: () => onPressAction(),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 10.0),
          child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text(text)));
    });
  }

  Widget _cardDatosUsuario() {
    return SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'Bienvenido:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Consumer<SessionModel>(
                builder: (context, session, child) {
                  return Text(session.matriculaSesion);
                },
              ),
              leading: Icon(
                Icons.account_circle,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Ultimo Acceso'),
              subtitle: Consumer<SessionModel>(
                builder: (context, session, child) {
                  return Text(session.accesoSesion);
                },
              ),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateScanner() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ScannerPage(),
        ));
  }

  void _navigateRegistroUsuario() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              RegistrarUsuarioPage(),
        ));
  }

  void _navigateRegistroAlumno() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              RegistrarAlumnoPage(),
        ));
  }
}
