import 'package:flutter/material.dart';
import '../theming/colors manegments.dart';
import '../theming/txt_style.dart';

class Txtfield extends StatefulWidget {
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final bool isPassword;

  const Txtfield({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<Txtfield> createState() => _TxtfieldState();
}

class _TxtfieldState extends State<Txtfield> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TxtStyle.size12w400blackhint,
        filled: true,
        fillColor: Colorsmanegments.field,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        )
            : null,
      ),
    );
  }
}