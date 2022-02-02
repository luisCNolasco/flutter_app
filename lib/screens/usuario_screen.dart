import 'package:app_incidencias/screens/listado_reportes_screen.dart';
import 'package:app_incidencias/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:app_incidencias/screens/informe_peligro.dart';
import 'package:app_incidencias/screens/reporte_abortaje.dart';
import 'package:app_incidencias/screens/impacto_animales.dart';
import 'package:app_incidencias/screens/inicio_screen.dart';

class UsuarioScreen extends StatefulWidget {
  static String id = 'usuario_screen';
  final String usuario;

  const UsuarioScreen(this.usuario, {Key? key}) : super(key: key);

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
        return const InicioScreen();
      case 1:
        return const ReporteAbortajeScreen();
      case 2:
        return const ImpactoAnimalScreen();
      case 3:
        return const InformePeligroScreen();
      case 4:
        return const ListadoReporteScreen();
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
              accountEmail: Text(widget.usuario + '@admin.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child:
                    Text('A', style: TextStyle(fontSize: 40, color: color_fap)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              selected: (0 == opcionSeleccionada),
              selectedColor: color_fap,
              onTap: () {
                _onSelectItem(0);
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Registrar reporte",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.airplanemode_active_outlined),
              title: Text('Reporte de Abortaje (RAMI)'),
              selected: (1 == opcionSeleccionada),
              selectedColor: color_fap,
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.warning_amber_outlined),
              title: Text('Impacto con animales'),
              selected: (2 == opcionSeleccionada),
              selectedColor: color_fap,
              onTap: () {
                _onSelectItem(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.dangerous),
              title: Text('Informe de peligros (IPPI)'),
              selected: (3 == opcionSeleccionada),
              selectedColor: color_fap,
              onTap: () {
                _onSelectItem(3);
              },
            ),
            Divider(
              color: color_fap,
              height: 10,
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              leading: Icon(Icons.article_outlined),
              title: Text('Listado de reportes'),
              selected: (4 == opcionSeleccionada),
              selectedColor: color_fap,
              onTap: () {
                _onSelectItem(4);
              },
            ),
            Divider(
              color: color_fap,
              height: 10,
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new_rounded),
              title: Text('Cerrar sesión'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.id, (route) => true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
