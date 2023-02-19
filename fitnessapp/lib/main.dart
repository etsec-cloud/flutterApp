import 'package:flutter/material.dart';
import 'package:fitnessapp/screens/loading.dart';
import 'package:fitnessapp/screens/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
    },
  ));
}
