import '../data/model/appointment_model.dart';

abstract class AppointmentStates {}

class AppointmentInitialState extends AppointmentStates {}

//  (GET All Appointments) ---
class GetAppointmentsLoadingState extends AppointmentStates {}

class GetAppointmentsSuccessState extends AppointmentStates {
  final List<AppointmentModel> appointments;
  GetAppointmentsSuccessState(this.appointments);
}

class GetAppointmentsErrorState extends AppointmentStates {
  final String error;
  GetAppointmentsErrorState(this.error);
}

// --- حالات عمل حجز جديد (POST Store Appointment) ---
class StoreAppointmentLoadingState extends AppointmentStates {}

class StoreAppointmentSuccessState extends AppointmentStates {}

class StoreAppointmentErrorState extends AppointmentStates {
  final String error;
  StoreAppointmentErrorState(this.error);
}