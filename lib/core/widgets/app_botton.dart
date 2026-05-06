import 'package:docdoc/core/theming/colors%20manegments.dart';
import 'package:flutter/cupertino.dart';

import '../theming/txt_style.dart';

class AppBotton extends StatelessWidget {
  double? width;
  String txt;

  AppBotton({super.key, required this.width, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: width,
      alignment: .center,
      decoration: BoxDecoration(
        color: Colorsmanegments.Primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(txt, style: TxtStyle.size14w400white),
    );
  }
}
