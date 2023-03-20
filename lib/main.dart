import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qa_reader/providers/providers.dart';
import 'package:qa_reader/providers/scan_list_provider.dart';
import 'package:qa_reader/screens/screens.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=> UiProvider()),
        ChangeNotifierProvider(create:(_)=> ScanListProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QA Reader',
        initialRoute: 'home',
        routes: {
          'home' :(_) =>const HomeScreen(),
          'map'  :(_) =>  const MapScreen()
        },
        theme: ThemeData(
          primarySwatch: Colors.amber
        ),
        
      ),
    );
  }
}