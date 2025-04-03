import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singletons_project/controllers/usuario_controller.dart';
import 'package:singletons_project/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.find<UsuarioController>();

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
                usuarioCtrl.cargarUsuario(Usuario(nombre: "Nestorss", edad: 17, profesiones: ["Titular de Grado Medio", "Futuro FullStack Developer"]));
                Get.snackbar(
                  'Usuario establecido',
                  'Ya no te va a molestar mas',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ]
                );
              },
              child: Text("Establecer Usuario", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(19);
              },
              child: Text("Cambiar edad", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.agregarProfesion("Profesion ${usuarioCtrl.profesionesCount + 1}");
              },
              child: Text("Añadir profesion", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              child: Text("Cambiar tema", style: TextStyle(color: Colors.white))
            )
          ],
        )
      ),
    );
  }
}