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

    return    Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
          itemCount:scans.length ,
          itemBuilder: (_, i) {
          return Dismissible(
            key: UniqueKey(),
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