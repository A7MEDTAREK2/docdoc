import 'package:docdoc/core/theming/colors%20manegments.dart';
import 'package:docdoc/core/theming/txt_style.dart';
import 'package:docdoc/core/widgets/app_botton.dart';
import 'package:docdoc/features/all_doctor/data/model_doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  final DoctorModel doctor;
  const ScreenProfile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsmanegments.backgroundapp,
      appBar: AppBar(
        backgroundColor: Colorsmanegments.backgroundapp,
        title: Text("Doctor Profile", style: TxtStyle.size24w400primary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            CircleAvatar(
              backgroundImage: AssetImage("lib/core/assets/Dr. Sarah Jenkins.png"),
              radius: 70,
            ),
            const SizedBox(height: 16),


            Text(doctor.name, style: TxtStyle.size24w400primary),
            const SizedBox(height: 8),


            Text(doctor.specialization.name, style: TxtStyle.size14w300black),
            Text(doctor.degree, style: TxtStyle.size14w300black),
            const SizedBox(height: 16),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.attach_money, color: Colorsmanegments.Primary),
                Text("${doctor.appointPrice} EGP", style: TxtStyle.size16w300black),
              ],
            ),
            const SizedBox(height: 8),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.time),
                const SizedBox(width: 4),
                Text("${doctor.startTime} - ${doctor.endTime}"),
              ],
            ),
            const SizedBox(height: 16),


            Row(
              children: [
                Icon(Icons.location_on, color: Colorsmanegments.Primary),
                const SizedBox(width: 4),
                Expanded(child: Text(doctor.address)),
              ],
            ),
            const SizedBox(height: 8),


            Text(doctor.description, style: TxtStyle.size16w300black),
            const SizedBox(height: 24),


            AppBotton(width: double.infinity, txt: 'Book Now'),
          ],
        ),
      ),
    );
  }
}