import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mvp/models/modeloCitas.dart';

class CitasC extends StatefulWidget {
  const CitasC({Key? key}) : super(key: key);

  @override
  State<CitasC> createState() => _Citas();
}

class _Citas extends State<CitasC> {

  late Future<List<Citas>> _listaCitas;

  // Obtener citas de la BD y obtenerla como una lista.
  Future<List<Citas>> _getCitas() async {
    final respuesta = await http.get(
      Uri.parse("http://10.0.2.2:18081/listCitas")
    );

    List<Citas> citas = [];

    if(respuesta.statusCode == 200){
      String body = utf8.decode(respuesta.bodyBytes);
      final jsonData = jsonDecode(body);

      for(var cita in jsonData){
        citas.add(Citas(cita['idCita'], cita['fecha'], cita['hora'], cita['tipoServicio']));
      }

      return citas;
    }
    else {
      throw Exception("Fallo la peticion.");
    }
  }


  @override
  void initState(){
    super.initState();
    _listaCitas = _getCitas();
  }

  @override
  Widget build(BuildContext context) {
    dynamic lista = _getCitas();
    return Scaffold(
      // Appbar
      appBar: AppBar(
        elevation: null,
        backgroundColor: Colors.black,
        leading: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, ''); // Agregar ruta valida.
          },
          child: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
        ),

        title: Container(
          child: Row(
            children: [
              const Text(
                'Veterinaria "El Pulgas" - Citas',
                 style: TextStyle(fontSize: 16)
                ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:20)
              ),
              Image.asset(
                'assets/images/petclinic.png',
                height: 45,
              ),  
            ],
          )
        ),
      ),
      
      // Cuerpo
      body: SingleChildScrollView(
        child: Column (
          children: [
            // Boton
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              width: 200,
              height: 48,
              child: ElevatedButton(
                onPressed: () {}, 
                child: Column(
                  children: const[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 7)
                    ),
                    Text(
                      'Acceder a las APIs',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ]
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300,48),
                  primary: Colors.black,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                ),
              ),
            ),
            // List View
            ListView.builder(
              itemCount: lista.length,
              itemBuilder: (_, index) => Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(lista[index].fecha),
                  subtitle: Text(lista[index].hora),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(lista[index].tipoServicio),
                    ],
                  ),
                ),
              ),
            )
          ]
        )
      )
    );
  }
}