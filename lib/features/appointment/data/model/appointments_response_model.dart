import 'appointment_model.dart';

class AppointmentsResponseModel {
  final String? message;
  final List<AppointmentModel>? data;
  final bool? status;
  final int? code;

  AppointmentsResponseModel({this.message, this.data, this.status, this.code});

  factory AppointmentsResponseModel.fromJson(Map<String, dynamic> json) {
    return AppointmentsResponseModel(
      message: json['message'],
      status: json['status'],
      code: json['code'],
      data: json['data'] != null
          ? List<AppointmentModel>.from(json['data'].map((x) => AppointmentModel.fromJson(x)))
          : null,
    );
  }
}