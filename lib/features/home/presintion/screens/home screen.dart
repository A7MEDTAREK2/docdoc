import 'package:dio/dio.dart';
import 'package:docdoc/core/theming/txt_style.dart';
import 'package:docdoc/features/all_doctor/data/data_sours/data.dart';
import 'package:docdoc/features/all_doctor/data/repo/repo.dart';
import 'package:docdoc/features/all_doctor/logic/cubit.dart';
import 'package:docdoc/features/all_doctor/logic/state.dart';
import 'package:docdoc/features/all_doctor/presentation/wedgite/doctor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors manegments.dart';
import '../../../all_doctor/presentation/screens/screen doctor.dart';
import '../home_Widget/app_bar_home.dart';
import '../home_Widget/card_welcome.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(Getrepo(GetDocoImpl(Dio())))..getDoctor(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colorsmanegments.backgroundapp,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const AppBarHome(),
                    const SizedBox(height: 16),
                    CardWelcome(
                      searchController: searchController,
                      onSearch: (value) {
                        if (value.isEmpty) {
                          context.read<DoctorCubit>().getDoctor();
                        } else {
                          context.read<DoctorCubit>().searchDoctor(value);
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<DoctorCubit, GetDoctorsStates>(
                      builder: (context, state) {
                        // 1. حالة التحميل
                        if (state is GetDoctorsLoadingState) {
                          return const Expanded(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        // 2. حالة الخطأ
                        if (state is GetDoctorsErrorState) {
                          return Expanded(
                            child: Center(child: Text(state.em)),
                          );
                        }

                        // 3. حالة نتائج البحث (يتم عرضها منفصلة)
                        if (state is SearchDoctorsSuccessState) {
                          final doctors = state.doctorsResponse.data;
                          return Expanded(
                            child: ListView.separated(
                              itemCount: doctors.length,
                              separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                return DoctorWidget(doctor: doctors[index]);
                              },
                            ),
                          );
                        }

                        // 4. حالة النجاح العادية (للعرض الافتراضي)
                        if (state is GetDoctorsSuccessState) {
                          final doctors = state.doctorsResponse.data.take(4).toList();
                          return Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Available Doctors",
                                        style: TxtStyle.size24w400primary),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => const AllDoctor(),
                                          ),
                                        );
                                      },
                                      child: Text("See All",
                                          style: TxtStyle.size14w800primary),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: ListView.separated(
                                    itemCount: doctors.length,
                                    separatorBuilder: (context, index) =>
                                    const SizedBox(height: 12),
                                    itemBuilder: (context, index) {
                                      return DoctorWidget(doctor: doctors[index]);
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
          );
        }
      ),
    );
  }
}