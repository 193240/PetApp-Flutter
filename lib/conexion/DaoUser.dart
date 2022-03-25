import 'dart:convert';
import 'package:conexion_veterinaria/dialogs/dialogs.dart';
import 'package:flutter/cupertino.dart';
import '../models/users.dart';
import 'package:http/http.dart' as http;

Future<List<users>> listaUsuarios(url) async {
  final respuesta = await http.get(Uri.parse(url));
  List<users> propietarios = [];
  if (respuesta.statusCode == 200){
    String body = utf8.decode(respuesta.bodyBytes);
    final jsonData = jsonDecode(body);
    for (var propietario in jsonData){
      propietarios.add(users(propietario['user'], propietario['password'], propietario['tipoU']));
    }
    return propietarios;
  }else{
    throw Exception("Fallo la conexión");
  }
}

Future <users> addUser(url,usuarioagregar,usuarioRetornar) async {
  final respuesta = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: usuarioagregar
  );
  if (respuesta.statusCode == 200){
    toast("Usuario Registrado Correctamente");
  }else{
    toast("Username Ya Registrado");
    //throw Exception("error al crear usuario");
  }
  return usuarioRetornar; //peticion realizada
}