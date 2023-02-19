import 'package:flutter/material.dart';

class CardItem {
  IconData? icon;
  Color? color;
  String? text;
  bool? isActivated;

  CardItem(IconData icon, Color color, String text, bool isActivated) {
    this.icon = icon;
    this.color = color;
    this.text = text;
    this.isActivated = isActivated;
  }
}
