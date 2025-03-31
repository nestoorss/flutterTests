import 'package:chat_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(uid: "2", nombre: "Irenika", email: "test2@test.com", online: true),
    Usuario(uid: "3", nombre: "Silvi", email: "test3@test.com", online: false),
    Usuario(uid: "4", nombre: "Huesitos", email: "test4@test.com", online: true),
    Usuario(uid: "5", nombre: "Alebozek", email: "test5@test.com", online: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Nombre"),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.exit_to_app)
        ),
        actions: <Widget> [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.offline_bolt, color: Colors.red)
            // child: Icon(Icons.check_circle, color: Colors.blue[400])
          )
        ]
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        child: _listViewUsuarios()
      )
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioListTile(usuarios[i]), 
      separatorBuilder: (_, i) => Divider(), 
      itemCount: usuarios.length
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(usuario.nombre.substring(0,2)),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        )
      );
  }

  _cargarUsuarios() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}