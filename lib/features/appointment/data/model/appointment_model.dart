import '../../../all_doctor/data/model_doctor.dart';
import 'patient_model.dart';

class AppointmentModel {
  final int? id;
  final DoctorModel? doctor;
  final PatientModel? patient;
  final String? appointmentTime;
  final String? appointmentEndTime;
  final String? status;
  final String? notes;
  final int? appointmentPrice;

  AppointmentModel({
    this.id,
    this.doctor,
    this.patient,
    this.appointmentTime,
    this.appointmentEndTime,
    this.status,
    this.notes,
    this.appointmentPrice,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      doctor: json['doctor'] != null ? DoctorModel.fromJson(json['doctor']) : null,
      patient: json['patient'] != null ? PatientModel.fromJson(json['patient']) : null,
      appointmentTime: json['appointment_time'],
      appointmentEndTime: json['appointment_end_time'],
      status: json['status'],
      notes: json['notes'],
      appointmentPrice: json['appointment_price'],
    );
  }
}