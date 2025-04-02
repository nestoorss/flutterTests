import 'package:flutter/material.dart';
import 'package:singletons_project/models/usuario.dart';
import 'package:singletons_project/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.UsuarioStream, 
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
              ? Text("Nombre: ${snapshot.data.nombre}")
              : Text("Pagina 2");
          }
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final nuevoUsuario = new Usuario(nombre: "Nestor", edad: 20);
                usuarioService.cargarUsuario(nuevoUsuario);
              },
              child: Text("Establecer Usuario", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(25);
              },
              child: Text("Cambiar edad", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {

              },
              child: Text("Añadir profesion", style: TextStyle(color: Colors.white))
            )
          ],
        )
      ),
    );
  }
}