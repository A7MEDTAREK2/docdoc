import 'package:docdoc/core/theming/txt_style.dart';
import 'package:docdoc/features/all_doctor/logic/cubit.dart';
import 'package:docdoc/features/all_doctor/logic/state.dart';

import 'package:docdoc/features/all_doctor/presentation/wedgite/doctor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors manegments.dart';
import '../../../all_doctor/presentation/screens/screen doctor.dart';
import '../home_Widget/app_bar_home.dart';
import '../home_Widget/card_welcome.dart';


class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit()..GetDoctor(),
      child: Scaffold(
        backgroundColor: Colorsmanegments.backgroundapp,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // الـ AppBar
                const AppBarHome(),
                const SizedBox(height: 16),

                // الـ Welcome Card
                const CardWelcome(),
                const SizedBox(height: 16),

                // الـ Doctors Section
                BlocBuilder<DoctorCubit, GetDoctorsStates>(
                  builder: (context, state) {
                    if (state is GetDoctorsLoadingState) {
                      return const Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (state is GetDoctorsErrorState) {
                      return Expanded(
                        child: Center(child: Text(state.em)),
                      );
                    }

                    if (state is GetDoctorsSuccessState) {
                      final doctors =
                      state.doctorsResponse.data.take(4).toList();
                      return Expanded(
                        child: Column(
                          children: [
                            // See All Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Available Doctors",
                                  style: TxtStyle.size24w400primary,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const AllDoctor(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "See All",
                                    style: TxtStyle.size14w800primary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),

                            // ListView
                            Expanded(
                              child: ListView.separated(
                                itemCount: doctors.length,
                                separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                                itemBuilder: (context, index) {
                                  return DoctorWidget(
                                      doctor: doctors[index]);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}