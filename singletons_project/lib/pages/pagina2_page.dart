import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singletons_project/bloc/usuario/usuario_cubit.dart';
import 'package:singletons_project/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina2"),
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
                  edad: 20, 
                  profesiones: [
                    "FullStack Developer",
                    "Ingeniero del Hub"
                  ]
                );
                usuarioCubit.seleccionarUsuario(newUser);
              },
              child: Text("Establecer Usuario", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.cambiarEdad(19);
              },
              child: Text("Cambiar edad", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
              child: Text("Añadir profesion", style: TextStyle(color: Colors.white))
            )
          ],
        )
      ),
    );
  }
}