import 'package:app_incidencias/screens/usuario_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  
  static String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          TituloLogo(),
          Center(
            child: InputsLogin(),
          )
        ],
      ),
    );
  }
}

class TituloLogo extends StatelessWidget {
  const TituloLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String titulo = 'BIENVENIDO';
    const estilo = TextStyle(
        fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
    return Container(
      color: const Color(0xff193f74),
      height: 350,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              titulo,
              style: estilo,
            ),
            const Image(image: AssetImage('assets/logo.png')),
          ],
        ),
      ),
    );
  }
}

class InputsLogin extends StatefulWidget {
  const InputsLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<InputsLogin> createState() => _InputsLoginState();
}

class _InputsLoginState extends State<InputsLogin> {
  final usuario = TextEditingController();
  final password = TextEditingController();

  // La clave global se usa para obtener el componente de formulario Form
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

   String usu='';
   String pass='';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 70),
      child: Form(
        key: loginKey,
        child: Column(
          children: [
            TextFormField(
              controller: usuario,
              decoration: const InputDecoration(
                label: Text('Usuario'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(label: Text('Contraseña')),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              onPressed: () {
                print('usuario: '+usu);
                print('contraseña: '+pass);
                _iniciarSesion(usuario.text,password.text);
              },
              minWidth: 500,
              height: 45,
              color: const Color(0xff193f74),
              child: const Text(
                'INGRESAR',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _iniciarSesion(String u,String c){

    if (u == '' || c == '') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('Complete los campos'),
            );
          });
    } else if (u != 'admin' && c != 'admin') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('Usuario o contraseña no válidos'),
            );
          });
    } else if (u == 'admin' || c == 'admin') {
      //Navegacion a otra pantalla
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return UsuarioScreen(u);
      }));
    }

    usuario.text = '';
    password.text = '';
  }
}



