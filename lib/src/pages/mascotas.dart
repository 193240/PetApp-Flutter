import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvp/src/styles/colors.dart';
import 'package:mvp/src/widgets/mascotaList3.dart';
import 'package:mvp/src/widgets/mascotasForm.dart';

class mascotasC extends StatefulWidget {
  mascotasC({Key? key}) : super(key: key);

  @override
  State<mascotasC> createState() => _mascotasCState();
}

class _mascotasCState extends State<mascotasC> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs:[
              Text('Lista',
               style: TextStyle(fontSize: 18),
              ),
              Text('Nuevo',
               style: TextStyle(fontSize: 18),),
            ]
          ),
          leading: Image.asset('assets/petclinic2.png'),
          leadingWidth: 100,
          title: const Text('Mascotas'),
          elevation: null,
          backgroundColor: ColorsSelect.txtBoHe,
          actions: <Widget>[
             IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              tooltip: 'Cerrar sesion',
              onPressed: () {
              },
            ),
          ],
          
        ),
      body:  TabBarView(
        children: [
          SwipeList(),
          mascotasForm()
        ],
      )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     const Text('Nueva macota',
          //     style: TextStyle(fontSize:25, color: ColorsSelect.txtBoSubHe, fontWeight: FontWeight.bold),
          //     ),
          //     ElevatedButton(
          //           onPressed: () => {
                      
          //           },
          //           child: Text(
          //             'Nuevo',
          //             style: TextStyle(fontSize: 18),
          //           ),
          //           style: ElevatedButton.styleFrom(
          //               primary: Color(ColorsSelect.btnBackgroundBo2.value),
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(5.0))),
          //         ),
          //   ]
            
          // ),
          // Container(
          //   child:SwipeList()
          // )
          // Container(
          //   height:550,
          //   child: SwipeList())
       
      
      
      ),
    );
    
  }
}