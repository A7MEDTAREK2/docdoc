import 'package:dio/dio.dart';
import 'package:docdoc/core/theming/colors manegments.dart';
import 'package:docdoc/core/theming/txt_style.dart';
import 'package:docdoc/features/all_doctor/data/data_sours/data.dart';
import 'package:docdoc/features/all_doctor/data/repo/repo.dart';
import 'package:docdoc/features/all_doctor/logic/cubit.dart';
import 'package:docdoc/features/all_doctor/logic/state.dart';
import 'package:docdoc/features/all_doctor/presentation/screens/screen doctor.dart';
import 'package:docdoc/features/all_doctor/presentation/wedgite/doctor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_Widget/HomeDrawer.dart';
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
      create: (context) =>
      DoctorCubit(Getrepo(GetDocoImpl(Dio())))..getDoctor(),
      child: Builder(
        builder: (innerContext) {
          final cubit = innerContext.read<DoctorCubit>(); // ✅

          return Scaffold(
            backgroundColor: Colorsmanegments.backgroundapp,
            appBar: AppBarHome(),
            drawer: HomeDrawer(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CardWelcome(
                      searchController: searchController,
                      onSearch: (value) {
                        if (value.isEmpty) {
                          cubit.getDoctor(); // ✅
                        } else {
                          cubit.searchDoctor(value); // ✅
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<DoctorCubit, GetDoctorsStates>(
                      bloc: cubit, // ✅
                      builder: (context, state) {
                        if (state is GetDoctorsLoadingState) {
                          return const Expanded(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        if (state is GetDoctorsErrorState) {
                          return Expanded(
                            child: Center(
                              child: Text(state.em),
                            ),
                          );
                        }

                        if (state is SearchDoctorsSuccessState) {
                          final doctors = state.doctorsResponse.data;
                          return Expanded(
                            child: ListView.separated(
                              itemCount: doctors.length,
                              separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                return DoctorWidget(doctor: doctors[index]);
                              },
                            ),
                          );
                        }

                        if (state is GetDoctorsSuccessState) {
                          final doctors =
                          state.doctorsResponse.data.take(4).toList();
                          return Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
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
                                Expanded(
                                  child: ListView.separated(
                                    itemCount: doctors.length,
                                    separatorBuilder: (_, __) =>
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

                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}