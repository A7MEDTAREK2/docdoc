import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardsHome extends StatelessWidget {
  String txt;

   CardsHome({super.key , required this.txt });

  @override
  Widget build(BuildContext context) {
    return Container(width:350,height: 190,child: Column(
      children: [
        Text(txt),
      ],
    ),);
  }
}
