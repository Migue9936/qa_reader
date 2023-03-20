import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qa_reader/providers/providers.dart';

class MapsScreen extends StatelessWidget {
   
  const MapsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final scansProvider = Provider.of<ScanListProvider>(context);
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount:10 ,
        itemBuilder: (_, index) {
          return ListTile(
            leading: Icon(Icons.map_sharp,color: Theme.of(context).primaryColor),
            title: const Text('http://fdsfdsfdsfdsfsd.com'),
            subtitle: const Text('ID:1'),
            trailing: Icon(Icons.arrow_forward_sharp),
            onTap: () => print('Sisas mi niño'),
          );
        },
      ),
    );
  }
}