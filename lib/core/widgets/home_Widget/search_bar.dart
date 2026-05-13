import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, required textStyle, required WidgetStateProperty<TextStyle> hintStyle, required String hintText, required WidgetStateProperty<Color> backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      textStyle: WidgetStateProperty.all(
        TextStyle(color: Colors.white),
      ),
      hintText: "search coffee",
      hintStyle: WidgetStateProperty.all(
        TextStyle(color: Colors.white),
      ),
      backgroundColor: WidgetStateProperty.all(
        Color.fromRGBO(49, 49, 49, 1),
      ),


    );
  }
}
