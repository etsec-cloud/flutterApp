import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getLocationIfServiceEnabled() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'latitude': position.latitude,
      'longitude': position.longitude,
    });
    print('ici');
  }

  @override
  void initState() {
    super.initState();
    getLocationIfServiceEnabled();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: SpinKitDancingSquare(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
