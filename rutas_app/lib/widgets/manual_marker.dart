import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/blocs/search/search_bloc.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.displayManualMarker
          ? _ManualMarkerBody()
          : const SizedBox();
      }
    );
  }
}

class _ManualMarkerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [

          Positioned(
            top: 70,
            left: 20,
            child: _BtnBack(),
          ),

          Center(
            child: Transform.translate(
              offset: Offset(0, -22),
              child: BounceInDown(
                from: 100,
                child: const Icon(Icons.location_on_rounded, size: 60)
              ),
            ),
          ),

          // Boton de confirmar
          Positioned(
            bottom: 70,
            left: 40,
            child: FadeInUp (
              duration: const Duration(milliseconds: 300),
              child: MaterialButton(
                minWidth: size.width - 120,
                color: Colors.black,
                elevation: 0,
                height: 50,
                shape: const StadiumBorder(),
                onPressed: () {
                  // TODO: confirmar ubicacion
                },
                child: const Text("Confirmar destino", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300))
              ),
            )
          )

        ],
      )
    );
  }
}

class _BtnBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft (
      duration: Duration(milliseconds: 300),
      child: CircleAvatar(
        maxRadius: 30,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            BlocProvider.of<SearchBloc>(context).add(OnDeactivateManualMarkerEvent());
          },
        )
      ),
    );
  }
}