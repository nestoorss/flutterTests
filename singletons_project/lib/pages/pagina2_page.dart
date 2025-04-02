import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singletons_project/models/usuario.dart';
import 'package:singletons_project/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
          ? Text("Nombre: ${usuarioService.usuario.nombre}")
          : Text("Pagina2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUser = new Usuario(
                  nombre: "Nestor", 
                  edad: 19,
                  profesiones: ['Fullstack Developer', 'Ingeniero del Hub']
                );
                usuarioService.usuario = newUser;
              },
              child: Text("Establecer Usuario", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(20);
              },
              child: Text("Cambiar edad", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.agregarProfesion();
              },
              child: Text("Añadir profesion", style: TextStyle(color: Colors.white))
            )
          ],
        )
      ),
    );
  }
}