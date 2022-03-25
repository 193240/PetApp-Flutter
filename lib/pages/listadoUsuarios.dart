import 'package:conexion_veterinaria/components/body.dart';
import 'package:conexion_veterinaria/components/footer.dart';
import 'package:conexion_veterinaria/components/header.dart';
import 'package:conexion_veterinaria/conexion/DaoUser.dart';
import 'package:flutter/material.dart';
import '../models/users.dart';

class listaUser extends StatefulWidget {
  listaUser({Key? key}) : super(key: key);

  @override
  State<listaUser> createState() => _listaUser();
}

class _listaUser extends State<listaUser> {

  Future<List<users>>? _listadoUsuarios;

  @override
  void initState(){
    super.initState();
    _listadoUsuarios = listaUsuarios("http://10.0.2.2:18081/listUser");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(context, "Lista De Usuarios", "assets/images/splash.png", "rutaDestino"),
      body: vistaTileUsuarios(context,_listadoUsuarios,"agregarUsuario"),
      floatingActionButton: botonAgregar(context, "agregarUsuario"),
    );
  }
}