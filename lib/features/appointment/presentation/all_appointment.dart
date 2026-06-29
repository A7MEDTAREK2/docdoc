import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/service/token.dart';
import '../logic/_cubit.dart';
import '../logic/_state.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen> {
  @override
  void initState() {
    super.initState();
    loadAppointments();
  }

  Future<void> loadAppointments() async {
    final token = await TokenStorage.getToken();

    if (token != null) {
      context.read<AppointmentCubit>().getMyAppointments(token: token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Appointments"),
      ),
      body: BlocBuilder<AppointmentCubit, AppointmentStates>(
        builder: (context, state) {
          if (state is GetAppointmentsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is GetAppointmentsErrorState) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is GetAppointmentsSuccessState) {
            if (state.appointments.isEmpty) {
              return const Center(
                child: Text("No Appointments"),
              );
            }

            return ListView.builder(
              itemCount: state.appointments.length,
              itemBuilder: (context, index) {
                final appointment = state.appointments[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(Icons.calendar_month),
                    title: Text(
                      appointment.doctor?.name ?? "Unknown Doctor",
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment.doctor?.specialization?.name ??
                              "No Specialization",
                        ),

                        Text(
                          appointment.status ?? "",
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}