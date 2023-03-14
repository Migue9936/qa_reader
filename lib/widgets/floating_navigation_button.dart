import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class FloatingNavigationButtom extends StatelessWidget {

  
  const FloatingNavigationButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#FFC107','Cancel ', false,ScanMode.QR);
          print(barcodeScanRes);
      },
      child: const Icon(Icons.qr_code_scanner_rounded),
      );
  }
}