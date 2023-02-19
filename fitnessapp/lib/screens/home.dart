import 'dart:async';

import 'package:fitnessapp/Widget/cardClass.dart';
import 'package:fitnessapp/Widget/useCard.dart';
import 'package:fitnessapp/Widget/maps.dart';
import 'package:fitnessapp/Widget/webViewCustom.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  bool runningMode = false;
  @override
  List<CardItem> list = [
    CardItem(Icons.run_circle_outlined, Colors.green, 'Walking', false),
    CardItem(Icons.directions_bike_outlined, Color.fromARGB(255, 15, 192, 246),
        'Cycling', false),
    CardItem(Icons.sports_gymnastics_outlined, Color.fromARGB(255, 8, 93, 139),
        'Gym', false),
  ];
  DateTime startTime = DateTime.now();
  LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  bool displayWebView = false;
  Timer? timer;
  Duration duration = Duration();
  @override
  void addTime() {
    final addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void Running() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());

    StreamSubscription<Position>? positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      print(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Running App'),
              backgroundColor: const Color.fromARGB(249, 0, 0, 0), // 1
              elevation: 0,
            ),
            body: SizedBox(
              height: size.height,
              child: Stack(children: <Widget>[
                SizedBox(
                    height: size.height,
                    child: OrderTrackingPage(
                      lat: data['latitude'],
                      long: data['longitude'],
                    )),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (runningMode == false) ...[
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: list.map((test) {
                                return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        list.forEach((element) {
                                          element.isActivated = false;
                                        });
                                        test.isActivated = true;
                                      });
                                    },
                                    child: SizedBox(
                                        width: 100,
                                        height: 110.0,
                                        child: useCard(card: test)));
                              }).toList(),
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 80),
                          child: MaterialButton(
                              minWidth: double.infinity,
                              color: const Color.fromARGB(255, 6, 155, 71),
                              textColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              onPressed: () {
                                Running();
                                setState(() {
                                  runningMode = true;
                                });
                              },
                              child: const Text('Start',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                        )
                      ],
                      if (runningMode == true) ...[
                        Text(
                          '${duration.inSeconds}',
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MaterialButton(
                                    minWidth: 100,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    textColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    onPressed: () {
                                      setState(() {
                                        timer!.cancel();
                                      });
                                    },
                                    child: const Text('Pause',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                                MaterialButton(
                                    minWidth: 100,
                                    color: Color.fromARGB(255, 206, 30, 30),
                                    textColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    onPressed: () {
                                      setState(() {
                                        timer!.cancel();
                                        duration = Duration();
                                        runningMode = false;
                                      });
                                    },
                                    child: const Text('Stop',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                              ],
                            )),
                      ]
                    ]),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: displayWebView ? size.height : 0,
                  child: WebViewCustom(),
                ),
              ]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  displayWebView = !displayWebView;
                });
              },
              tooltip: 'Increment',
              child:
                  displayWebView ? Icon(Icons.close) : Icon(Icons.shopping_bag),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat));
  }
}
