import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qa_reader/providers/providers.dart';

class CustomNavigationButtons extends StatelessWidget {
  const CustomNavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {

  final uiProvider = Provider.of<UiProvider>(context);


    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (value) => uiProvider.selectedMenuOpt = value,
      currentIndex: currentIndex,
      showUnselectedLabels: false,
      elevation: 1,
      items: const [
       BottomNavigationBarItem(icon: Icon(Icons.map,),label: 'Maps'),
       BottomNavigationBarItem(icon: Icon(Icons.compass_calibration_outlined),label: 'Directions') 
      ]);
  }
}