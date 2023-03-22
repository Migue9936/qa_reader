import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qa_reader/providers/providers.dart';
import 'package:qa_reader/widgets/widgets.dart';

class MapsScreen extends StatelessWidget {
   
  const MapsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  const ScanTiles(type: 'geo');
  }
}