import 'dart:io';

import 'package:band_name_nestorss/models/band.dart';
import 'package:band_name_nestorss/services/socket_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [];

  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on('active-bands', (_handleActiveBands));
    super.initState();
  }

  _handleActiveBands(dynamic payload) {
    this.bands = (payload as List)
      .map( (band) => Band.fromMap(band) )
      .toList();

    setState((){});
  }

  @override
  void dispose() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.off('active-bands');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("BandNames", style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        actions: <Widget> [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: (socketService.serverStatus == ServerStatus.Online)
              ? Icon(Icons.check_circle, color: Colors.blue[300])
              : Icon(Icons.offline_bolt, color: Colors.red)
          )
        ],
      ),
      body: Column(
        children: <Widget> [
          _showGraph(),
          Expanded(
            child: ListView.builder(
              itemCount: bands.length,
              itemBuilder: (context, i) => _bandTile(bands[i])
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewBand,
        child: Icon(Icons.add)
      ),
    );
  }

  Widget _bandTile(Band banda) {

    final socketService = Provider.of<SocketService>(context, listen: false); 

    return Dismissible(
      key: Key(banda.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) => socketService.socket.emit('delete-band', {'id': banda.id}),
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
        onTap: () => socketService.socket.emit('vote-band', {'id': banda.id}),
      ),
    );
  }

  addNewBand() {

    final textController = new TextEditingController();

    if (Platform.isIOS) {
      // Dialogo iOS
      return showCupertinoDialog(
        context: context, 
        builder: (_) => CupertinoAlertDialog(
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
        )
      );
    } else {
      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
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
        )
      );
    }
  }

  void addBandToList(String name) {

    if (name.length > 1) {
      final socketService = Provider.of<SocketService>(context, listen: false); 
      socketService.emit('add-band', {"name": name});
    }
    
    Navigator.pop(context);
  }

  // Mostrar grafica
  Widget _showGraph() {
    if (bands.isEmpty) {
      return Container(
        height: 200,
        child: Center(
          child: Text("No data available", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      );
    }

    Map<String, double> dataMap = new Map();
    bands.forEach((band) {
      dataMap.putIfAbsent(band.name, () => band.votes.toDouble());
    });

    final List<Color> colorList = [
      Colors.blue[50]!,
      Colors.blue[200]!,
      Colors.pink[50]!,
      Colors.pink[200]!,
      Colors.yellow[50]!,
      Colors.yellow[200]!,
    ];

    return Container(
      width: double.infinity,
      height: 200,
      child: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        centerText: "Votos",
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
        // gradientList: ---To add gradient colors---
        // emptyColorGradient: ---Empty Color gradient---
      )
    );
  }

}