import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
   
  final options = const['Megamind', 'Bobo', 'Superbigote', 'Tu'];
  const Listview2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Tipo 2"),
      ),
      body: ListView.separated(
        itemBuilder: (context, i) => ListTile(
          title:Text(options[i]),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap:() {
            final game = options[i];
            print(game);
          },
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: options.length
      )
    );
  }
}