import 'package:flutter/material.dart';

class DatosGenerales extends StatelessWidget {
  const DatosGenerales({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const[
        Text(
          'DATOS GENERALES',
          style: TextStyle(fontSize: 25, color: Color(0xff193f74),fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        CampoTexto(label: 'Número'),
        CampoTexto(label: 'Fecha de incidencia'),
        CampoTexto(label: 'Nombre de piloto'),
        CampoTexto(label: 'Grado de piloto'),
        CampoTexto(label: 'Unidad'),
        CampoTexto(label: 'Misión'),
        CampoTexto(label: 'Tipo de aeronave'),
        CampoTexto(label: 'Departamento'),
        CampoTexto(label: 'Localidad'),
      ],
    );
  }
}

class CampoTexto extends StatelessWidget {
  final String label;
  const CampoTexto({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        decoration: InputDecoration(
          label: Text(label),
        ),
      ),
    );
  }
}
