class StoreAppointmentRequestBody {
  final int doctorId;
  final String startTime;

  StoreAppointmentRequestBody({
    required this.doctorId,
    required this.startTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'doctor_id': doctorId,
      'start_time': startTime,
    };
  }
}