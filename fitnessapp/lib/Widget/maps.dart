import 'package:fitnessapp/Class/LatLong.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingPage extends StatelessWidget {
  OrderTrackingPage({
    super.key,
    required this.lat,
    required this.long,
  });
  final double lat;
  final double long;
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long),
          zoom: 11.0,
        ),
      ),
    );
  }
}
