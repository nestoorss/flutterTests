import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        String? barcodeScanRes = await SimpleBarcodeScanner.scanBarcode(
                  context,
                  barcodeAppBar: const BarcodeAppBar(
                    appBarTitle: 'Escanea QR',
                    centerTitle: false,
                    enableBackButton: true,
                    backButtonIcon: Icon(Icons.arrow_back_ios),
                  ),
                  isShowFlashIcon: false,
                  delayMillis: 500,
                  cameraFace: CameraFace.back,
                  scanFormat: ScanFormat.ONLY_QR_CODE,
                );
        if (barcodeScanRes == '-1') {
          return;
        }
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes!); // Da error de tipo, pero aun asi funciona y hace lo que tiene que hacer
        launchURL(context, nuevoScan);
      },
    );
  }
}