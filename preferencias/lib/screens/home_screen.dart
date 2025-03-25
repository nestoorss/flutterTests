import 'package:flutter/material.dart';
import 'package:preferencias/shared/preferences.dart';
import 'package:preferencias/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  static String routeName = "Home";

  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home")
      ),
      drawer: SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("isDarkmode: ${Preferences.isDarkmode}"),
          Divider(),
          Text("Genero: ${Preferences.gender}"),
          Divider(),
          Text("Nombre de usuario: ${Preferences.name}"),
          Divider(),
        ],
      ),
    );
  }
}