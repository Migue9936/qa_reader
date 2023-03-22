import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:provider/provider.dart';
import 'package:qa_reader/providers/providers.dart';
import 'package:qa_reader/utils/url_luncher.dart';

class FloatingNavigationButtom extends StatelessWidget {

  
  const FloatingNavigationButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
          // ignore: unused_local_variable
           String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#FFC107','Cancel ', false,ScanMode.QR);
          
          //final  barcodeScanRes = 'geo:4.635886,-74.125416';
          if (barcodeScanRes=='-1') {
            return;
          }
          //final barcodeScanRes1 = 'https://fernando-herrera.com';
          // ignore: use_build_context_synchronously
          final scanListProvider = Provider.of<ScanListProvider>(context,listen: false);

          final newScan= await scanListProvider.newScan(barcodeScanRes);
          //final newScan1= await scanListProvider.newScan(barcodeScanRes1);
          
          // ignore: use_build_context_synchronously
          urlLuncher(context,newScan);
      },
      child: const Icon(Icons.qr_code_scanner_rounded),

      
      );
  }
}