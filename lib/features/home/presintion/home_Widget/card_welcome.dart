import 'package:docdoc/core/theming/colors%20manegments.dart';
import 'package:docdoc/core/theming/txt_style.dart';
import 'package:flutter/material.dart';

class CardWelcome extends StatelessWidget {
  const CardWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colorsmanegments.Primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello, Welcome",
            style: TxtStyle.size14w400white,
          ),
          const SizedBox(height: 8),
          Text(
            "Find your specialist and book an appointment.",
            style: TxtStyle.size14w400white,
          ),
          const SizedBox(height: 16),
          SearchBar(
            hintText: "Search for a doctor...",
            leading: const Icon(Icons.search),
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ],
      ),
    );
  }
}