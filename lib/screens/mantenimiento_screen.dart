import 'package:app_incidencias/widgets/datos_generales.dart';
import 'package:flutter/material.dart';

class MantenimientoScreen extends StatelessWidget {
  const MantenimientoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children:  [
        const DatosGenerales(),
        const SizedBox(height: 25),
        Container(
          height: 40,
          color: const Color(0xff193f74),
          child: Column(
            children:const [
              SizedBox(height: 7),
              Text(
                'FALLAS DE MOTOR',
                style: TextStyle(
                    fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
                
              ),
            ],
          ),
        ),
        const CampoTexto(label: 'Altura'),
        const CampoTexto(label: 'Velocidad'),
        const CampoTexto(label: 'Potencia'),
        const CampoTexto(label: 'Instr. de motor'),
        const CampoTexto(label: 'Actitud de aeronave'),
        const AreaTexto(),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 45,horizontal: 80),
           child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              onPressed: () {

              },
              height: 45,
              color: const Color(0xff193f74),
              child: const Text(
                'ENVIAR',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
         )
      ],
    );
  }
}

class AreaTexto extends StatelessWidget {
  const AreaTexto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        minLines:4, // any number you need (It works as the rows for the textarea)
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(
          label: Text('Breve descripción de la incidencia'),
        ),
      ),
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
