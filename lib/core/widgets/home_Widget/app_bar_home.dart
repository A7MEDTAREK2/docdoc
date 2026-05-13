import 'package:docdoc/core/theming/colors%20manegments.dart';
import 'package:docdoc/core/theming/txt_style.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(leading: Icon(Icons.menu , color:  Colorsmanegments.Primary,),title: Text('CareConnect', style: TxtStyle.size24w400primary,),);
  }
}
