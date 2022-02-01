import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:app_incidencias/widgets/datos_generales.dart';

class AbordajeMision extends StatefulWidget {
  const AbordajeMision({Key? key}) : super(key: key);

  @override
  State<AbordajeMision> createState() => _PeligroAviarioState();
}

class _PeligroAviarioState extends State<AbordajeMision> {
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Inicio',
      'label': 'Inicio',
    },
    {
      'value': 'Durante vuelo',
      'label': 'Durante vuelo',
    },
    {
      'value': 'Final',
      'label': 'Final',
    },
  ];
bool valueMedidas = false;
bool valueAdvertencia = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        const DatosGenerales(),
        const SizedBox(height: 25),
        Container(
          height: 40,
          color: const Color(0xff193f74),
          child: Column(
            children: const [
              SizedBox(height: 7),
              Text(
                'IMPACTO CON AVES',
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Select(label: 'Base', items: _items),
        Select(label: 'Vuelo', items: _items),
        Select(label: 'Manto', items: _items),
        const CampoTexto(label: 'Facilidades instalaciones'),
        const CampoTexto(label: 'Equipo de apoyo'),
        const CampoTexto(label: 'Transporte y conexos'),
        const CampoTexto(label: 'Contra incendios'),
        const CampoTexto(label: 'Armamento/expl'),
      

        //ModeloCheckBox('Se advirtio el peligro'),
         AreaTexto('Descripción de incidencia'),
         AreaTexto('Recomendaciones'),
         AreaTexto('Indice de riesgo'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 80),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            onPressed: () {
              print('${valueMedidas}${valueAdvertencia}');
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

class Select extends StatefulWidget {
  final label;
  const Select({
    Key? key,
    required this.label,
    required List<Map<String, dynamic>> items,
  })  : _items = items,
        super(key: key);

  final List<Map<String, dynamic>> _items;

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SelectFormField(
        labelText: widget.label,
        items: widget._items,
        onChanged: (val) => print(val),
        onSaved: (val) => print(val),
      ),
    );
  }
}

class AreaTexto extends StatefulWidget {

  String titulo;
  AreaTexto(this.titulo,{
    Key? key,
  }) : super(key: key);

  @override
  State<AreaTexto> createState() => _AreaTextoState();
}

class _AreaTextoState extends State<AreaTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        minLines:
            4, // any number you need (It works as the rows for the textarea)
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          label: Text(widget.titulo),
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
