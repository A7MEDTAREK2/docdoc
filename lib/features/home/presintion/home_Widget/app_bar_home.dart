import 'package:flutter/material.dart';
import 'package:docdoc/core/theming/colors manegments.dart';
import 'package:docdoc/core/theming/txt_style.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colorsmanegments.backgroundapp,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu,
            color: Colorsmanegments.Primary,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Text(
        'CareConnect',
        style: TxtStyle.size24w400primary,
      ),
    );
  }
}