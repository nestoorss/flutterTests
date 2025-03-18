import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
   
  final options = const['Megamind', 'Bobo', 'Superbigote', 'Tu'];
  const Listview1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Tipo 1"),
      ),
      body: ListView(
        children: [

          ...options.map(
            (villano) => ListTile(
              title:Text(villano),
              trailing: Icon(Icons.arrow_forward_ios),
            )
          ).toList(),

          Divider()

        ],
      )
    );
  }
}