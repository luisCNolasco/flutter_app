import 'package:flutter/material.dart';

import 'package:app_incidencias/screens/abordaje_mision_screen.dart';
import 'package:app_incidencias/screens/mantenimiento_screen.dart';
import 'package:app_incidencias/screens/peligro_aviario_screen.dart';
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
        return MantenimientoScreen();
      case 2:
        return PeligroAviario();
      case 3:
        return AbordajeMision();
      case 4:
      return PrincipalScreen();
    }
  }

  _onSelectItem(int pos) {
    setState(() {
      Navigator.of(context).pop();
      opcionSeleccionada = pos;
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
              leading: Icon(Icons.settings_outlined),
              title: Text('Por mantenimiento'),
              
              selected: (1 == opcionSeleccionada),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.warning_amber_outlined),
              title: Text('Peligro aviario'),
              selected: (2 == opcionSeleccionada),
              onTap: () {
                _onSelectItem(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.airplanemode_active_outlined),
              title: Text('Abordaje de misión'),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   backgroundColor: color_fap,
      //   child: const Icon(Icons.add_a_photo),
      // ),
    );
  }
}
