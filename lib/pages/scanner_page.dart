import 'package:eduscan/pages/main_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class ScannerPage extends StatefulWidget {
  static String id = 'scanner_page';
  final String matricula, acceso;
  const ScannerPage({Key? key, required this.matricula, required this.acceso})
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
              _showDialogUnkownUser(data);
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
                      builder: (context) => MainMenuPage(
                          matricula: widget.matricula, acceso: widget.acceso),
                    ),
                    (e) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
