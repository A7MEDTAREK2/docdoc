import 'package:docdoc/core/theming/colors%20manegments.dart';
import 'package:docdoc/core/theming/txt_style.dart';
import 'package:docdoc/core/widgets/app_botton.dart';
import 'package:docdoc/features/all_doctor/presentation/screens/screen_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../appointment/logic/_cubit.dart';
import '../../../appointment/presentation/appointment_Screen.dart';
import '../../data/model_doctor.dart';

class DoctorWidget extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colorsmanegments.white,
        ),
        child: Column(
          mainAxisAlignment: .start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "lib/core/assets/Dr. Sarah Jenkins.png",
                  ),
                  radius: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        children: [
                          SizedBox(height: 30),
                          Icon(Icons.star, color: Colors.yellow),
                          Text("4.9"),
                          Text("(128 reviews)"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(doctor.name, style: TxtStyle.size24w400black),
                      SizedBox(height: 5),
                      Text(
                        doctor.specialization.name,
                        style: TxtStyle.size14w800primary,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(CupertinoIcons.time),
                          SizedBox(width: 4),
                          Text(doctor.startTime),
                          SizedBox(width: 15),
                          Text(doctor.endTime),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => AppointmentCubit(),
                            child: BookAppointmentScreen(doctor: doctor), // باصينا بيانات الدكتور هنا
                          ),
                        ),
                      );
                    },
                    child: AppBotton(width: 147, txt: 'book now'),
                  ),
                  SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ScreenProfile(doctor: doctor),
                        ),
                      );
                    },
                    child: AppBotton(width: 147, txt: 'View Profile'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
