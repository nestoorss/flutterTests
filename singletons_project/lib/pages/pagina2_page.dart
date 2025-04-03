import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singletons_project/bloc/user/user_bloc.dart';
import 'package:singletons_project/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

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
                final Usuario user = Usuario(nombre: "Nestor", edad: 20, profesiones: ["FullStack Developer", "Ingeniero del Hub"]);
                userBloc.add(ActivateUser(user));
              },
              child: Text("Establecer Usuario", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAge(24));
              },
              child: Text("Cambiar edad", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add(AddProfession("Novo profesion"));
              },
              child: Text("Añadir profesion", style: TextStyle(color: Colors.white))
            )
          ],
        )
      ),
    );
  }
}