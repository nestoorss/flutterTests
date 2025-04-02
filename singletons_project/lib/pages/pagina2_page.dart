import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {
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

              },
              child: Text("Establecer Usuario", style: TextStyle(color: Colors.white))
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {

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