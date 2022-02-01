import 'package:flutter/material.dart';

import 'package:app_incidencias/screens/informe_peligro.dart';
import 'package:app_incidencias/screens/reporte_abortaje.dart';
import 'package:app_incidencias/screens/impacto_animales.dart';
import 'package:app_incidencias/screens/principal_screen_usuario.dart';

class UsuarioScreen extends StatefulWidget {
  final String usuario;
  const UsuarioScreen(this.usuario,{Key? key}) : super(key: key);

  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  String dropdownValue = '[Seleccione]';
  int opcionSeleccionada = 0;
  final color_fap = const Color(0xff193f74);
  
  //return PrincipalScreen();
  _obtenerPantalla(int pos) {
    switch (pos) {
      case 0:
        return PrincipalScreen();
      case 1:
        return ReporteAbortajeScreen  ();
      case 2:
        return ImpactoAnimalScreen();
      case 3:
        return InformePeligroScreen();
      case 4:
      return PrincipalScreen();
    }
  }

  _onSelectItem(int pos) {
    setState(() {
      opcionSeleccionada = pos;
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ' + widget.usuario),
        backgroundColor: color_fap,
      ),
      body: _obtenerPantalla(opcionSeleccionada),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: color_fap),
              accountName: Text(widget.usuario),
              accountEmail: Text(widget.usuario+'@admin.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child:
                    Text('A', style: TextStyle(fontSize: 40, color: color_fap)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              selected: (4 == opcionSeleccionada),
              onTap: () {
                _onSelectItem(4);
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Registro de incidencia",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.airplanemode_active_outlined),
              title: Text('Reporte de Abortaje (RAMI)'),
              
              selected: (1 == opcionSeleccionada),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.warning_amber_outlined),
              title: Text('Impacto con animales'),
              selected: (2 == opcionSeleccionada),
              onTap: () {
                _onSelectItem(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.dangerous),
              title: Text('Informe de peligros (IPPI)'),
              selected: (3 == opcionSeleccionada),
              onTap: () {
                _onSelectItem(3);
              },
            ),
            Divider(
              color: color_fap,
              height: 50,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new_rounded),
              title: Text('Cerrar sesión'),
              onTap: () {
                print('Cerrando sesión');

              },
            ),
          ],
        ),
      ),
       /*floatingActionButton: FloatingActionButton.extended(
         onPressed: () {
           setState(() {
             _showMyDialog();
           });

         },
         icon: Icon(Icons.article_outlined),
         label: Text("Crear Reporte"),
         backgroundColor: color_fap,
       ),*/
    );
  }

/*
  void _showMyDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
            children:[
              ListTile(
                  title: const Text('Abortaje de Misión'),
                  leading: const Icon(Icons.dangerous),
                  onTap: (){
                    setState(() {
                      _onSelectItem(1);
                    });

                  }
              ),
              ListTile(
                  title: const Text('Peligro aviario'),
                  leading: const Icon(Icons.airplanemode_active),
                  onTap: (){
                    setState(() {
                      _onSelectItem(2);
                    });

                  }
              ),
              ListTile(
                  title: const Text('Peligros potenciales'),
                  leading: const Icon(Icons.warning_amber_outlined),
                  onTap: (){
                    setState(() {
                      _onSelectItem(3);
                    });
                  }
              ),
            ]
        );
      },
    );
  }*/
}
