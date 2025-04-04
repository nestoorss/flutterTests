import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/blocs/search/search_bloc.dart';
import 'package:rutas_app/delegates/delegates.dart';
import 'package:rutas_app/models/models.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.displayManualMarker
          ? const SizedBox()
          : FadeInDown(duration: Duration(milliseconds: 300), child: _SearchbarBody());
      }
    );
  }
}

class _SearchbarBody extends StatelessWidget {
  void onSearchResults(BuildContext context, SearchResult result) {

    final searchBloc = BlocProvider.of<SearchBloc>(context);

    if (result.manual) {
      searchBloc.add(OnActivateManualMarkerEvent());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea (
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: 50,
        child: GestureDetector(
          onTap: () async {
            final result = await showSearch(context: context, delegate: SearchDestinationDelegate());
            if (result == null) return;

            onSearchResults(context, result);
          },
          child: Container(
            padding: const  EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 5, offset: const Offset(0,5))
              ]
            ),
            child: Text("¿Donde quieres ir?", style: TextStyle(color: Colors.black87))
          )
        )
      ),
    );
  }
}