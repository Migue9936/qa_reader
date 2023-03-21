import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qa_reader/models/scan_model.dart';

class MapScreen extends StatefulWidget {
   
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

   final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
  

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    
    // ignore: prefer_const_constructors
    final CameraPosition initialPoint = CameraPosition(
        target: scan.getLatLng(),
        zoom: 17,
        tilt: 80
      );
    
    Set<Marker> markers = <Marker>{};
    markers.add( Marker(
        markerId: const MarkerId('geo-location'),
        position: scan.getLatLng()
      )
    );

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async{
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getLatLng(),
                    tilt: 80,
                    zoom: 17 
                  )
                )
              );
          }, 
            icon: const Icon(Icons.location_pin))
        ],
      ),
      body: GoogleMap(
        compassEnabled: true,
        mapToolbarEnabled: true,
        markers: markers,
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        initialCameraPosition: initialPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers_outlined),
        onPressed: () {
          
        },),
    );
  }
}