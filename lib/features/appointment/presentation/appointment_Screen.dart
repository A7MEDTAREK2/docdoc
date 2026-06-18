import 'package:docdoc/core/theming/colors%20manegments.dart';
import 'package:docdoc/core/theming/txt_style.dart';
import 'package:docdoc/core/widgets/app_botton.dart';
import 'package:docdoc/features/all_doctor/data/model/model_doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/service/token.dart';
import '../logic/_cubit.dart';
import '../logic/_state.dart';

class BookAppointmentScreen extends StatelessWidget {
  final DoctorModel doctor;
  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentCubit, AppointmentStates>(
      listener: (context, state) {
        if (state is StoreAppointmentLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: Colorsmanegments.Primary),
            ),
          );
        }

        if (state is StoreAppointmentSuccessState) {
          Navigator.pop(context); //
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The booking was successful! '), backgroundColor: Colors.green),
          );
          Navigator.pop(context);
        }

        if (state is StoreAppointmentErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Booking error: ${state.error}'), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colorsmanegments.backgroundapp,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          backgroundColor: Colorsmanegments.backgroundapp,
          title: Text("Confirm Booking", style: TxtStyle.size24w400primary),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("lib/core/assets/Dr. Sarah Jenkins.png"),
                radius: 70,
              ),
              const SizedBox(height: 16),

              Text(doctor.name, style: TxtStyle.size24w400primary),
              const SizedBox(height: 8),

              Text(doctor.specialization.name, style: TxtStyle.size14w300black),
              Text(doctor.degree, style: TxtStyle.size14w300black),
              const SizedBox(height: 24),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Appointment Summary:", style: TxtStyle.size16w300black.copyWith(fontWeight: FontWeight.bold)),
              ),
              const Divider(height: 20, thickness: 1),

              Row(
                children: [
                  Icon(Icons.attach_money, color: Colorsmanegments.Primary),
                  const SizedBox(width: 8),
                  Text("Price: ${doctor.appointPrice} EGP", style: TxtStyle.size16w300black),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Icon(CupertinoIcons.time, color: Colorsmanegments.Primary),
                  const SizedBox(width: 8),
                  Text("Selected Time: ${doctor.startTime}", style: TxtStyle.size16w300black),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Icon(Icons.location_on, color: Colorsmanegments.Primary),
                  const SizedBox(width: 8),
                  Expanded(child: Text("Clinic Address: ${doctor.address}")),
                ],
              ),
              const SizedBox(height: 40),

              // 🛠️ التعديل الجديد بالكامل هنا جوه الـ InkWell 🛠️
              InkWell(
                onTap: () async {
                  // 1. قراءة التوكن
                  String? realToken = await TokenStorage.getToken();

                  if (realToken != null) {
                    // 2. تنظيف الوقت من الـ PM/AM
                    String cleanTime = doctor.startTime
                        .replaceAll('PM', '')
                        .replaceAll('AM', '')
                        .trim();

                    DateTime now = DateTime.now();
                    String formattedDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

                    String finalDateTime = "$formattedDate ${cleanTime.substring(0, 5)}";

                    context.read<AppointmentCubit>().createAppointment(
                      doctorId: doctor.id,
                      startTime: finalDateTime,
                      token: realToken,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('عفواً، لم يتم العثور على التوكن. يرجى إعادة تسجيل الدخول.'), backgroundColor: Colors.orange),
                    );
                  }
                },
                child: AppBotton(width: double.infinity, txt: 'Confirm Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}