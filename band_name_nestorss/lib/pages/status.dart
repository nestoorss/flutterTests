import 'package:band_name_nestorss/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {

    final socketService = Provider.of<SocketService>(context);
    final socket = socketService.socket;

    return Scaffold(
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text("ServerStatus: ${socketService.serverStatus}")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          print("Enviando mensaje al servidor...");
          socket.emit('emitir-mensaje', {'nombre': 'Nestor', 'mensaje': 'Hoal'});
        }
      ),
    );
  }
}