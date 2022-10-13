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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: 15.0,),
                _cardDatosUsuario(),
                const SizedBox(
                  height: 15.0,
                ),

                _button("Escanear Codigo", _navigatePrincipal),
              ],
            ),
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
              title: const Text('Matricula:'),
              subtitle: Text(widget.matricula),
              leading: Icon(
                Icons.account_circle,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Nombre'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Apellido Paterno'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Apellido Materno'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Estatus'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Direccion'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Nacimiento'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Correo Institucional'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Correo Personal'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Celular'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Numero de Seguridad Social'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Tipo de Sangre'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Grupo'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Carrera'),
              subtitle: Text(widget.acceso),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Cuatrimestre'),
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

  void _navigatePrincipal() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              RegistrarAlumnoPage(matricula: widget.matricula, acceso: widget.acceso),
        ));
  }
}
