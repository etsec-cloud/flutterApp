import 'package:flutter/material.dart';

class CardItem {
  IconData? icon;
  Color? color;
  String? text;

  CardItem(IconData icon, Color color, String text) {
    this.icon = icon;
    this.color = color;
    this.text = text;
  }
}
