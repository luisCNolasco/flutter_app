import 'package:flutter/material.dart';

class ListadoReporteScreen extends StatefulWidget {
  const ListadoReporteScreen({Key? key}) : super(key: key);

  @override
  _ListadoReporteScreenState createState() => _ListadoReporteScreenState();
}

class _ListadoReporteScreenState extends State<ListadoReporteScreen> {
  final color_fap = const Color(0xff193f74);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listado de reportes'),
          automaticallyImplyLeading: false,
          backgroundColor: color_fap,
        ),
        body: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(vertical: 5),
            children: [
              for(int i=0;i<15;i++)
                CardReporte(titulo:'Reporte ${i+1}',subtitulo:'SubReporte ${i+1}')
            ]));
  }
}

class CardReporte extends StatefulWidget {
  String titulo;
  String subtitulo;
  CardReporte({
    Key? key,
    required this.titulo,
    required this.subtitulo
  }) : super(key: key);

  @override
  State<CardReporte> createState() => _CardReporteState();
}

class _CardReporteState extends State<CardReporte> {
  final color_fap = const Color(0xff193f74);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.article_outlined,
          size: 40,
        ),
        title: Text(widget.titulo),
        subtitle: Text(widget.subtitulo),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
        iconColor: color_fap,
        contentPadding: EdgeInsets.all(10),
        onTap: () {
          print(widget.titulo);
        },
      ),
    );
  }
}
