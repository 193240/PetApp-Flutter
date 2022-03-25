import 'package:conexion_veterinaria/components/footer.dart';
import 'package:conexion_veterinaria/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import '../models/users.dart';

ListTileTheme vistaTileUsuarios(context,_listadoUsuario,vistaDestino){
  return ListTileTheme(
    contentPadding: EdgeInsets.all(15),
    iconColor: Colors.red,
    textColor: Colors.black54,
    tileColor: Colors.yellow[100],
    style: ListTileStyle.list,
    dense: true,
    child: listaUser(context,_listadoUsuario,vistaDestino),
  );
}

FutureBuilder<List<users>> listaUser(context,_listadoUsuario,vistaDestino){
  return FutureBuilder<List<users>>(
    future: _listadoUsuario,
      builder: (context, snapshot) {
        
        if (snapshot.hasData){
          final List<users> listaUsuarios = snapshot.data ?? <users>[]; //user es la lista de usuarios
          return vistaListaUsuarios(context,listaUsuarios,vistaDestino);
        }
        
        else if (snapshot.hasError){ 
          return const Text("Error");
        }

        return const Center( 
          child: CircularProgressIndicator()
        );
      }
    );
  }

ListView vistaListaUsuarios(context,_listadoUsuario,vistaDestino) {
  return ListView.builder(
    itemCount: _listadoUsuario.length,
    itemBuilder: (_, index) => Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(_listadoUsuario[index].user),
          subtitle: Text(_listadoUsuario[index].tipoUsuario),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    toast("Modulo Editar En Progreso");
                    //Navigator.pushNamed(context, vistaDestino); //metodo get editar
                  },
                  icon: Icon(Icons.edit)),

              IconButton(
                  onPressed: () {
                    toast("Modulo Eliminar En Progreso");
                    //Navigator.pushNamed(context, 'editarPropietario'); //metodo post eliminar
                  },
                  icon: Icon(Icons.delete)),

            ],
          ),
        ),
      ),
  );
}

Container textoInformativo(texto,altitud){
  return Container(
      padding: EdgeInsets.only(top: altitud),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 15
        ),
      )
    );
}

Container campoInformacion(altitud,texto,hint,helper,inputControlador){
  return Container(
      padding: EdgeInsets.only(top: altitud),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            texto,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: inputControlador,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                helperText: helper,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: hint),
          ),
        ],
      ));
}