import 'package:flutter/material.dart';


class MainMenuPage extends StatefulWidget {

  static String id = 'main_menu_page';

  String matricula,acceso;
  MainMenuPage({Key? key,required this.matricula,required this.acceso}) : super(key: key);


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
              SizedBox(height: 15.0,),
              _buttonLogin("Registrar Usuario"),
              SizedBox(height: 15.0,),
              _buttonLogin("Registrar Alumno"),
              SizedBox(height: 15.0,),
              _buttonLogin("Escanear Codigo"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textMatricula(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'texto1',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
    );
  }

  Widget _buttonLogin(String text) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return ElevatedButton(
              onPressed: (){
                setState(() {

                });
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                  child: Text(text)
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




}