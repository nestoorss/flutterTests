import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/pages/pages.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/widgets/widgets.dart';

class HomePage extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Historial"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              Provider.of<ScanListProvider>(context, listen: false).borrarTodos();
            },
          )
        ]
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorbar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    // Usar el ScanListProvider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    
    switch (currentIndex) {
      case 0: 
        scanListProvider.cargarScanPorTipo('geo');
        return ScanTiles(tipo: "geo");
      case 1: 
        scanListProvider.cargarScanPorTipo('http');
        return ScanTiles(tipo: "http");
      default: return scanListProvider.cargarScanPorTipo('geo');
    }
  }
}