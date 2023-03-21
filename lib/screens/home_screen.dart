import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qa_reader/providers/providers.dart';
import 'package:qa_reader/screens/screens.dart';
import 'package:qa_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History'),
        actions: [
          IconButton(
           icon: const Icon(Icons.delete_forever),
            onPressed: () {
               Provider.of<ScanListProvider>(context,listen: false).deleteAll();
              
            },
          ),
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationButtons(),
      floatingActionButton: const FloatingNavigationButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    
    //Get selected manu option
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    // DBProvider.db.database;

    final scanListProvider = Provider.of<ScanListProvider>(context,listen: false);


    switch (currentIndex) {
      case 0:
      scanListProvider.getScansByType('geo');
        return const MapsScreen();
      case 1:
      scanListProvider.getScansByType('http');
        return const AdressesScreen();
      default:
      return const MapsScreen();
    }
    
  }


}