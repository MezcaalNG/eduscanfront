import 'package:eduscan/api/models/session_model.dart';
import 'package:eduscan/pages/registrar_alumno_page.dart';
import 'package:eduscan/pages/registrar_usuario_page.dart';
import 'package:eduscan/pages/scanner_page.dart';
import 'package:eduscan/pages/student_data_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/api_service.dart';
import '../api/models/consultar_alumno_request_model.dart';

class MainMenuPage extends StatefulWidget {
  static String id = 'main_menu_page';
  const MainMenuPage({Key? key})
      : super(key: key);
  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  String matri="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('EduScan'),
        ),
        body: Center(
          child:
          Consumer<SessionModel>(
            builder: (context, session, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _cardDatosUsuario(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  if(session.nivelSesion==3)
                  _button("REGISTRAR USUARIO", _navigateRegistroUsuario, Icons.add_reaction),
                  const SizedBox(
                    height: 15.0,
                  ),
                  if(session.nivelSesion==3)
                  _button("REGISTRAR ALUMNO", _navigateRegistroAlumno, Icons.add_moderator),
                  const SizedBox(
                    height: 15.0,
                  ),
                  if(session.nivelSesion!=0)
                  _button("ESCANEAR CODIGO", _navigateScanner, Icons.qr_code),
                  const SizedBox(
                    height: 15.0,
                  ),
                  if(session.nivelSesion==0)
                  _button("MIS DATOS", _doConsulta, Icons.account_box),
                ],
              );
            },
          )

        ),
      ),
    );
  }

  Widget _button(String text, void Function() onPressAction, IconData icono) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton.icon(
          onPressed: () => onPressAction(),
          icon: Icon(icono),
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
              child: Text(text)));
    });
  }

  Widget _cardDatosUsuario() {
    return SizedBox(
      height: 150,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'BIENVENIDO:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Consumer<SessionModel>(
                builder: (context, session, child) {
                  matri=session.matriculaSesion;
                  return Text(session.matriculaSesion);
                },
              ),
              leading: const Icon(
                Icons.account_circle,
                color: Colors.blue,
              ),
            ),
            //const Divider(),
            ListTile(
              title: const Text('ULTIMO ACCESO'),
              subtitle: Consumer<SessionModel>(
                builder: (context, session, child) {
                  return Text(session.accesoSesion);
                },
              ),
              leading: const Icon(
                Icons.access_time,
                color: Colors.blue,
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

  void _doConsulta() async {
    ConsultarAlumnoResponse responseConsulta = (await ApiService().postConsultaAlumno(matri))!;
    //Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
      _navigate(responseConsulta);
  }

  void _navigate(ConsultarAlumnoResponse requestAlumno) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              StudentDataPage(requestAlumno: requestAlumno),
        ),
            (e) => false);
  }
}
