import 'package:eduscan/pages/registrar_alumno_page.dart';
import 'package:eduscan/pages/registrar_usuario_page.dart';
import 'package:eduscan/pages/scanner_page.dart';
import 'package:flutter/material.dart';

class MainMenuPage extends StatefulWidget {
  static String id = 'main_menu_page';
  final String matricula, acceso;
  const MainMenuPage({Key? key, required this.matricula, required this.acceso})
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
              subtitle: Text(widget.matricula),
              leading: Icon(
                Icons.account_circle,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Ultimo Acceso'),
              subtitle: Text(widget.acceso),
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
              ScannerPage(matricula: widget.matricula, acceso: widget.acceso),
        ));
  }

  void _navigateRegistroUsuario() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              RegistrarUsuarioPage(matricula: widget.matricula, acceso: widget.acceso),
        ));
  }

  void _navigateRegistroAlumno() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              RegistrarAlumnoPage(matricula: widget.matricula, acceso: widget.acceso),
        ));
  }
}
