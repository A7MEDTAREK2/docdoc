import 'package:docdoc/features/all_doctor/logic/cubit.dart';
import 'package:docdoc/features/all_doctor/logic/state.dart';
import 'package:docdoc/features/all_doctor/presentation/wedgite/doctor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors manegments.dart';
import '../../../../core/theming/txt_style.dart';


class AllDoctor extends StatelessWidget {
  const AllDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit()..GetDoctor(),
      child: Scaffold(appBar:   AppBar(leading: IconButton(onPressed:() => Navigator.pop(context),  icon: Icon(Icons.arrow_back_ios_new)),
        backgroundColor: Colorsmanegments.backgroundapp,
        title: Text("All Doctor", style: TxtStyle.size24w400primary),
      ),
        backgroundColor: Colorsmanegments.backgroundapp,
        body: SafeArea(
          child: BlocBuilder<DoctorCubit, GetDoctorsStates>(
            builder: (context, state) {
              if (state is GetDoctorsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is GetDoctorsErrorState) {
                return Center(child: Text(state.em));
              }

              if (state is GetDoctorsSuccessState) {
                final doctors = state.doctorsResponse.data;
                return ListView.builder(

                  itemCount: doctors.length,

                  itemBuilder: (context, index) {
                    return DoctorWidget(doctor: doctors[index]);
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}