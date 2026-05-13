import 'package:docdoc/core/widgets/home_Widget/app_bar_home.dart';
import 'package:docdoc/core/widgets/home_Widget/card_welcome.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        AppBarHome(),CardWelcome(),
      ],
    ),
    );
  }
}
