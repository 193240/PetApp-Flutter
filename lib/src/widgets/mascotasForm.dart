import 'package:flutter/material.dart';
import 'package:mvp/src/styles/colors.dart';

class mascotasForm extends StatefulWidget {
  mascotasForm({Key? key}) : super(key: key);

  @override
  State<mascotasForm> createState() => _mascotasFormState();
}

class _mascotasFormState extends State<mascotasForm> {
  TextEditingController nameController = TextEditingController();
  int? id;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nombre'
                    ),
                    onChanged: (text) {
                      setState(() {
                        
                      });
                    },
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Tipo'
                    ),
                    onChanged: (text) {
                      setState(() {
                        
                      });
                    },
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Fecha ingreso'
                    ),
                    onChanged: (text) {
                      setState(() {
                        
                      });
                    },
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(
                    maxLines: 6,
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Razon',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        
                      });
                    },
                  )),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () => {},
                  child: Text(
                    'Agregar',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 48),
                      primary: Color(ColorsSelect.btnBackgroundBo2.value),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                ),
              ),

              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //     ElevatedButton(
              //       child: Text('Actualizar',
              //         style: TextStyle(fontSize:18, color: Colors.black ),
                      
              //       ),
              //       onPressed: () => {},
              //       style: ElevatedButton.styleFrom(
              //         primary: Color(ColorsSelect.paginator.value),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(25.0))),
                
              //     ),
              //     ElevatedButton(
              //       child: Text('Eliminar',
              //       style: TextStyle(fontSize:18),),
              //       onPressed: () => {},
              //     style: ElevatedButton.styleFrom(
                      
              //         primary: Color(ColorsSelect.paginatorNext.value),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(25.0))),
              //   ),
              //   ],),
              // ),
              
            ],
          ),
        )));
  }
}
