import 'dart:io';

import 'package:app_incidencias/widgets/datos_generales.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReporteAbortajeScreen extends StatefulWidget {
  const ReporteAbortajeScreen({Key? key}) : super(key: key);

  @override
  State<ReporteAbortajeScreen> createState() => _ReporteAbortajeScreenState();
}

class _ReporteAbortajeScreenState extends State<ReporteAbortajeScreen> {

  ImagePicker imagePicker = ImagePicker();

  File? imagenSeleccionada;
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
          padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 20),
          child: MaterialButton(
              child: const Text('Seleccione imagen',style: TextStyle(color: Colors.white),),
              color: Colors.blueGrey,
              onPressed: (){
                _showMyDialog();
              }),
        ),
        SizedBox(
          width: 220,
          height: 220,
          child: imagenSeleccionada != null ? Image.file(imagenSeleccionada!):
          const Center(
            child: Image(image:AssetImage('assets/imagen_nula.jpg')),
          ),
        ),
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

  _imagenCamaraGaleria(ImageSource source) async {
    PickedFile picture = await imagePicker.getImage(source: source);
    setState(() {
      imagenSeleccionada = File(picture.path);
    });
    Navigator.pop(context);
  }

  void _showMyDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
            children:[
              ListTile(
                  title: const Text('Cámara'),
                  leading: const Icon(Icons.camera_alt),
                  onTap: (){
                    _imagenCamaraGaleria(ImageSource.camera);
                  }
              ),
              ListTile(
                  title: const Text('Galería'),
                  leading: const Icon(Icons.image),
                  onTap: (){
                    _imagenCamaraGaleria(ImageSource.gallery);
                  }
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: MaterialButton(
                    child: const Text('Cancelar',style: TextStyle(color: Colors.white),),
                    color: Colors.redAccent,
                    onPressed: (){
                      Navigator.pop(context);
                    }),
              ),
            ]
        );
      },
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
