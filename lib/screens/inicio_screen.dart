import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {

  const InicioScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(image: AssetImage('assets/logo.png'))
          ),
          
        ],
      ),
    );
  }
}