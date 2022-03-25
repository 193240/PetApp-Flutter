import 'package:flutter/material.dart';

import '../components/body.dart';
import '../components/footer.dart';
import '../components/header.dart';

class addUser extends StatefulWidget {
  addUser({Key? key}) : super(key: key);

  @override
  State<addUser> createState() => _addUser();
}

class _addUser extends State<addUser> {

  //TextEditingController inputUsuario = new TextEditingController();
  //TextEditingController inputPassword = new TextEditingController();
  //TextEditingController inputTipo = new TextEditingController();

  final List<TextEditingController> inputs = [
  for (int i = 0; i < 3; i++)
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(context,"Agregar Usuario","assets/images/splash.png","listadoUsuarios"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            textoInformativo("Agrega Un Nuevo Propietario", 30.0),
            campoInformacion(30.0,"Usuario","Ingrese Su Username", "", inputs[0]),
            campoInformacion(15.0,"Password","Ingrese Su Password", "", inputs[1]),
            campoInformacion(15.0,"Tipo De Usuario","Ingrese Si Es Empleado O Propietario","",inputs[2]),
            botonAceptacionUsuario(35.00, "Agregar Usuario",inputs),
          ],
        ),
      )
    );
  }
}