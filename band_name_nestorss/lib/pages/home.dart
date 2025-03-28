import 'dart:io';

import 'package:band_name_nestorss/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: "1", name: "Goty", votes: 3),
    Band(id: "2", name: "Fary", votes: 53),
    Band(id: "3", name: "Puso", votes: 5),
    Band(id: "4", name: "Amir", votes: 4)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BandNames", style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTile(bands[i])
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewBand,
        child: Icon(Icons.add)
      ),
    );
  }

  Widget _bandTile(Band banda) {
    return Dismissible(
      key: Key(banda.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print("Dir: $direction");
        print("Id: ${banda.id}");
        // TODO: llamar al borrado en el server
      },
      background: Container(
        padding: EdgeInsets.only(left: 8),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("Delete band", style: TextStyle(color: Colors.white))
        )
      ),
      child: ListTile (
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(banda.name.substring(0,2))
        ),
        title: Text(banda.name),
        trailing: Text("${banda.votes}", style: TextStyle(fontSize: 20)),
        onTap: () {
          print(banda.name);
        }
      ),
    );
  }

  addNewBand() {

    final textController = new TextEditingController();

    if (Platform.isIOS) {
      // Dialogo iOS
      return showCupertinoDialog(
        context: context, 
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("New band name:"),
            content: CupertinoTextField(
              controller: textController
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text("Add"),
                onPressed: () => addBandToList(textController.text)
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text("Dismiss"),
                onPressed: () => Navigator.pop(context)
              ),
            ]
          );
        }
      );
    } else {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("New band name:"),
            content: TextField(
              controller: textController
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text("Add"),
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => addBandToList(textController.text)
              )
            ]
          );
        }
      );
    }

    
  }

  void addBandToList(String name) {
    print(name);

    if (name.length > 0) {
      this.bands.add(Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState((){});
    }
    
    Navigator.pop(context);
  }

}