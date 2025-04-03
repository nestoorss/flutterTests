import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/blocs/gps/gps_bloc.dart';

class GpsAccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return !state.isGpsEnabled
              ? _EnableGpsMessage()
              : _AccessButton();
          }
        )
      ),
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Debe de habilitar el GPS', 
    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300));
  }
}

class _AccessButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Es necesario el acceso a GPS"),
        MaterialButton(
          onPressed: () {
            
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();

          },
          color: Colors.black,
          shape: const StadiumBorder(),
          elevation: 0,
          splashColor: Colors.transparent,
          child: const Text("Solicitar Acceso", style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}