import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/blocs/gps/gps_bloc.dart';
import 'package:rutas_app/screens/gps_access_screen.dart';
import 'package:rutas_app/screens/map_screen.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted
            ? MapScreen()
            : GpsAccessScreen();
        },
      )
    );
  }
}