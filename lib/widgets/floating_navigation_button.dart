import 'package:flutter/material.dart';

class FloatingNavigationButtom extends StatelessWidget {
  const FloatingNavigationButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.qr_code_scanner_rounded),
      );
  }
}