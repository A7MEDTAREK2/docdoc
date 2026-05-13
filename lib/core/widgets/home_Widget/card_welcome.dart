import 'package:docdoc/core/theming/colors%20manegments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWelcome extends StatelessWidget {
  const CardWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      color: Colorsmanegments.Primary,
      child: Column(
        children: [
          Text("Find your specialist and book an appointment."),SearchBar()
        ],
      ),
    );
  }
}
