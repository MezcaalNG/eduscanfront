import 'package:eduscan/api/models/registrar_alumno_request_model.dart';
import 'package:eduscan/pages/registrar_alumno_page.dart';
import 'package:eduscan/pages/registrar_usuario_page.dart';
import 'package:eduscan/pages/scanner_page.dart';
import 'package:flutter/material.dart';

class StudentDataPage extends StatefulWidget {
  static String id = 'student_data_page';
  final RegistrarAlumnoRequest requestAlumno;
  const StudentDataPage({Key? key, required this.requestAlumno})
      : super(key: key);
  @override
  State<StudentDataPage> createState() => _StudentDataPageState();
}

class _StudentDataPageState extends State<StudentDataPage> {
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
              subtitle: Text(""),
              leading: Icon(
                Icons.account_circle,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Nombre'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Apellido Paterno'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Apellido Materno'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Estatus'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Direccion'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Nacimiento'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Correo Institucional'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Correo Personal'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Celular'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Numero de Seguridad Social'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Tipo de Sangre'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Grupo'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Carrera'),
              subtitle: Text(""),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('Cuatrimestre'),
              subtitle: Text(""),
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
              const RegistrarAlumnoPage(),
        ));
  }
}
