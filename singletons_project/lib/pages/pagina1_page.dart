import 'package:flutter/material.dart';
import 'package:singletons_project/models/usuario.dart';
import 'package:singletons_project/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina1"),
      ),
      body: StreamBuilder(
        stream: usuarioService.UsuarioStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
            ? InformacionUsuario(usuario: snapshot.data)
            : Center(child: Text("No hay informacion"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2')
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario({required this.usuario});

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

          ListTile(title: Text("Nombre: ${usuario.nombre}")),
          ListTile(title: Text("Edad: ${usuario.edad}")),
          Divider(),

          Text("Profesiones", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ListTile(title: Text("Profesion 1: ")),
          ListTile(title: Text("Profesion 2: ")),
          ListTile(title: Text("Profesion 3: ")),
        ],
      )
    );
  }
}