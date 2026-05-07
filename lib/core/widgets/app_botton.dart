import 'package:docdoc/core/theming/colors%20manegments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theming/txt_style.dart';

class AppBotton extends StatelessWidget {
  double? width;
  String txt;
  final VoidCallback? onTap;

  AppBotton({super.key, required this.width, required this.txt,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Container(
        height: 48,
        width: width,
        alignment: .center,
        decoration: BoxDecoration(
          color: Colorsmanegments.Primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(txt, style: TxtStyle.size14w400white),
      ),
    );
  }
}
