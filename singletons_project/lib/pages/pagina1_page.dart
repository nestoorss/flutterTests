import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singletons_project/bloc/user/user_bloc.dart';
import 'package:singletons_project/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina1"),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false)
                .add(DeleteUser());
            },
            icon: const Icon(Icons.delete_outline)
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.existUser
            ? InformacionUsuario(user: state.user!)
            : const Center(child: (Text("No hay usuario seleccionado")));
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

  final Usuario user;

  const InformacionUsuario({super.key, required this.user});

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

          ListTile(title: Text("Nombre: ${user.nombre}")),
          ListTile(title: Text("Edad: ${user.edad}")),
          Divider(),

          Text("Profesiones", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ...user.profesiones.map(
            (prof) => ListTile(title: Text(prof))
          ).toList()

        ],
      )
    );
  }
}