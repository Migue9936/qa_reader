


import 'package:flutter/material.dart';
import 'package:qa_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlLuncher (BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.value);
 
  if (scan.type == 'http') {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  } else {
    Navigator.pushNamed(context, 'map',arguments: scan);
  }
}