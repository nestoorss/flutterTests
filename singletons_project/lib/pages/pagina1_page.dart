import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singletons_project/controllers/usuario_controller.dart';
import 'package:singletons_project/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina1"),
      ),
      body: Obx(() => usuarioCtrl.existeUsuario.value
                      ? InformacionUsuario(usuario: usuarioCtrl.usuario.value)
                      : NoInfo()
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Get.toNamed("pagina2")
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("No hay usuario seleccionado"),
      )
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("General", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ListTile(title: Text("Nombre: ${this.usuario.nombre}")),
          ListTile(title: Text("Edad: ${this.usuario.edad}")),
          Divider(),

          Text("Profesiones", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ...usuario.profesiones.map((profesion) => ListTile(
            title: Text(profesion),
          )).toList()
        ],
      )
    );
  }
}