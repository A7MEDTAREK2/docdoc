import 'package:flutter/material.dart';

import '../theming/colors manegments.dart';
import '../theming/icons.dart';
import '../theming/txt_style.dart';

class Txtfield extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;

  const Txtfield({super.key, required this.hintText, required this.prefixIcon, required TextEditingController controller});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TxtStyle.size12w400blackhint,
        filled: true,
        fillColor: Colorsmanegments.field,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8,),
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
