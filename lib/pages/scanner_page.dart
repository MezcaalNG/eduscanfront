import 'package:eduscan/api/models/registrar_alumno_request_model.dart';
import 'package:eduscan/pages/main_menu_page.dart';
import 'package:eduscan/pages/student_data_page.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

import '../api/api_service.dart';
import '../api/models/consultar_alumno_request_model.dart';

class ScannerPage extends StatefulWidget {
  static String id = 'scanner_page';
  const ScannerPage({Key? key})
      : super(key: key);
  @override
  State<ScannerPage> createState() => _ScannerPagePageState();
}

class _ScannerPagePageState extends State<ScannerPage> {
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
              _scannerView()
            ],
          ),
        ),
      ),
    );
  }

  Widget _scannerView() {
    ScanController controller = ScanController();
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return SizedBox(
          width: 250, // custom wrap size
          height: 250,
          child: ScanView(
            controller: controller,
            // custom scan area, if set to 1.0, will scan full area
            scanAreaScale: .7,
            scanLineColor: Colors.green.shade400,
            onCapture: (data) {
              _doConsulta(data);
            },
          ),
        );
      },
    );
  }

  Future<void> _showDialogUnkownUser(data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('QR'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('QR detectado'),
                Text(data),
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

  void _doConsulta(String matricula) async {
    ConsultarAlumnoResponse responseConsulta = (await ApiService().postConsultaAlumno(matricula))!;
    //Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (responseConsulta.matricula.isEmpty) {
      _showDialogUnkownUser(matricula);
    } else {
      _navigate(responseConsulta);
    }
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
