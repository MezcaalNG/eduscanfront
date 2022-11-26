import 'package:eduscan/pages/registrar_alumno_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/models/consultar_alumno_request_model.dart';
import '../api/models/session_model.dart';
import 'main_menu_page.dart';

class StudentDataPage extends StatefulWidget {
  static String id = 'student_data_page';
  final ConsultarAlumnoResponse requestAlumno;
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
                _cardDatosUsuario(),
                const SizedBox(
                  height: 15.0,
                ),

                _button("Regresar", _navigatePrincipal),
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
      child: Card(

        child: Consumer<SessionModel>(
        builder: (context, session, child) {
          return Column(
            children: [
              ListTile(
                title: const Text('Matricula:'),
                subtitle: Text(widget.requestAlumno.matricula),
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              ListTile(
                title: const Text('Nombre'),
                subtitle: Text(widget.requestAlumno.nombre),
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              ListTile(
                title: const Text('Apellido Paterno'),
                subtitle: Text(widget.requestAlumno.apellidop),
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              ListTile(
                title: const Text('Apellido Materno'),
                subtitle: Text(widget.requestAlumno.apellidom),
                leading: Icon(
                  Icons.account_box,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              if(session.nivelSesion!=2)
              ListTile(
                title: const Text('Estatus'),
                subtitle: Text(widget.requestAlumno.estatus),
                leading: Icon(
                  Icons.check_box,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              if(session.nivelSesion!=1&&session.nivelSesion!=2)
              ListTile(
                title: const Text('Direccion'),
                subtitle: Text(widget.requestAlumno.direccion),
                leading: Icon(
                  Icons.maps_home_work,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              if(session.nivelSesion!=1&&session.nivelSesion!=2)
              ListTile(
                title: const Text('Nacimiento'),
                subtitle: Text(widget.requestAlumno.nacimiento),
                leading: Icon(
                  Icons.calendar_month,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              if(session.nivelSesion!=1)
              ListTile(
                title: const Text('Correo Institucional'),
                subtitle: Text(widget.requestAlumno.emailins),
                leading: Icon(
                  Icons.email,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              if(session.nivelSesion!=1&&session.nivelSesion!=2)
              ListTile(
                title: const Text('Correo Personal'),
                subtitle: Text(widget.requestAlumno.emailper),
                leading: Icon(
                  Icons.email_outlined,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              if(session.nivelSesion!=1)
              ListTile(
                title: const Text('Celular'),
                subtitle: Text(widget.requestAlumno.celular),
                leading: Icon(
                  Icons.phone,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              if(session.nivelSesion!=1&&session.nivelSesion!=2)
              ListTile(
                title: const Text('Numero de Seguridad Social'),
                subtitle: Text(widget.requestAlumno.nss),
                leading: Icon(
                  Icons.security,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              if(session.nivelSesion!=1&&session.nivelSesion!=2)
              ListTile(
                title: const Text('Tipo de Sangre'),
                subtitle: Text(widget.requestAlumno.tiposangre),
                leading: Icon(
                  Icons.water_drop,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              if(session.nivelSesion!=1)
              ListTile(
                title: const Text('Grupo'),
                subtitle: Text(widget.requestAlumno.grupo),
                leading: Icon(
                  Icons.people,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              if(session.nivelSesion!=1)
              ListTile(
                title: const Text('Carrera'),
                subtitle: Text(widget.requestAlumno.carrera),
                leading: Icon(
                  Icons.work,
                  color: Colors.blue[500],
                ),
              ),
              //const Divider(),
              if(session.nivelSesion!=1)
              ListTile(
                title: const Text('Cuatrimestre'),
                subtitle: Text(widget.requestAlumno.cuatrimestre),
                leading: Icon(
                  Icons.grade,
                  color: Colors.blue[500],
                ),
              ),
            ],
          );
        })



      ),
    );

  }

  void _navigatePrincipal() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const MainMenuPage(),
        ));
  }
}
