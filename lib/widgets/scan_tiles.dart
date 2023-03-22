import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qa_reader/providers/providers.dart';
import 'package:qa_reader/utils/url_luncher.dart';

class  ScanTiles extends StatelessWidget {
  const ScanTiles({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    
    final scansListProvider = Provider.of<ScanListProvider>(context);
    final scans = scansListProvider.scans;

    return scans.isEmpty
    ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Icon(Icons.qr_code_scanner, size: 60),
            SizedBox(height: 16),
            Text('Por favor, escanear', style: TextStyle(fontSize: 20)),
          ],
        ),
      )

    : Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
          itemCount:scans.length ,
          itemBuilder: (_, i) {
          return Dismissible(
            key: Key(scans[i].id.toString()),
            background: Container(color: Colors.redAccent,),
            onDismissed: (direction) {
              Provider.of<ScanListProvider>(context,listen: false).deleteScanById(scans[i].id!);
            },
            child: ListTile(
              leading:
                type =="http"
                ? Icon(Icons.webhook,color: Theme.of(context).primaryColor)
                : Icon(Icons.map_outlined,color: Theme.of(context).primaryColor),
              title:  Text(scans[i].value),
              subtitle:  Text(scans[i].id.toString()),
              trailing: const Icon(Icons.arrow_forward_sharp),
              onTap: () => urlLuncher(context, scans[i]),
            ),
          );
        },
      ),
    );
  }
}