import 'package:eduscan/pages/main_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPreviewPage extends StatefulWidget {
  static String id = 'qr_preview_page';
  final String matriculaAlumno;
  const QrPreviewPage({Key? key, required this.matriculaAlumno})
      : super(key: key);
  @override
  State<QrPreviewPage> createState() => _QrPreviewPageState();
}

class _QrPreviewPageState extends State<QrPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SizedBox(height: 15.0,),
              QrImage(
                data: widget.matriculaAlumno,
                version: QrVersions.auto,
                size: 200.0,
              ),
              const SizedBox(
                height: 15.0,
              ),
              _button("Menu Principal", _navigatePrincipal),
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

  void _navigatePrincipal() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const MainMenuPage(),
        ));
  }
}
