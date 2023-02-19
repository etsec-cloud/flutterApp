import 'package:fitnessapp/Widget/cardClass.dart';
import 'package:flutter/material.dart';

class useCard extends StatelessWidget {
  const useCard({
    super.key,
    required this.card,
  });

  final CardItem card;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ClipPath(
            child: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color:
                  card.isActivated! ? Colors.greenAccent : Colors.transparent,
              width: 5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(card.icon, size: 50, color: card.color),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(card.text!,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              )
            ]),
      ),
    )));
  }
}
