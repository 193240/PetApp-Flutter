import 'dart:convert';

import 'package:conexion_veterinaria/conexion/DaoUser.dart';
import 'package:conexion_veterinaria/models/users.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

FloatingActionButton botonAgregar(context,rutaDestino){
  return FloatingActionButton(
    onPressed: () {
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat;
        Navigator.pushNamed(context, rutaDestino);
      },
      backgroundColor: Colors.green,
      child: const Icon(Icons.add),
  );
}

Container botonAceptacionUsuario(altitud,texto,cuerpo){
  return Container(
    padding: EdgeInsets.only(top: altitud),
    margin: const EdgeInsets.symmetric(horizontal: 30.0),
    child: ElevatedButton(
      child: Text(
      texto,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    ),
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(350, 48),
      primary: Color(ColorsSelect.btnBackgroundBo2.value),
      onPrimary: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
    ),
    onPressed: () {
      Map json = {
        'user': cuerpo[0].text,
        'password':cuerpo[1].text,
        'tipoU':cuerpo[2].text
      };
      var usuario = JsonEncoder().convert(json);
      users u = users(cuerpo[0].text, cuerpo[1].text, cuerpo[2].text);
      addUser("http://10.0.2.2:18081/user/add", usuario, u);
    },
  ),
  );
}