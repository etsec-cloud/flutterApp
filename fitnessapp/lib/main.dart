import 'package:fitnessapp/Widget/cardClass.dart';
import 'package:fitnessapp/Widget/useCard.dart';
import 'package:fitnessapp/Widget/maps.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  List<CardItem> list = [
    CardItem(Icons.run_circle_outlined, Colors.green, 'Walking'),
    CardItem(Icons.directions_bike_outlined, Color.fromARGB(255, 15, 192, 246),
        'Cycling'),
    CardItem(Icons.sports_gymnastics_outlined, Color.fromARGB(255, 8, 93, 139),
        'Gym'),
  ];
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list.map((test) {
                    return SizedBox(
                        width: 100, height: 110.0, child: useCard(card: test));
                  }).toList(),
                ),
                OrderTrackingPage(),
              ],
            )));
  }
}
