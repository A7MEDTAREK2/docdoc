import '../data sourse/remote_data_source.dart';
import '../model/appointments_response_model.dart';
import '../model/store_appointment_request_body.dart';

class AppointmentRepo {
  final AppointmentWebServices _webServices = AppointmentWebServices();

  Future<AppointmentsResponseModel> getAllAppointments(String token) async {
    try {
      final response = await _webServices.getAllAppointments(token);
      return AppointmentsResponseModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> storeAppointment({
    required StoreAppointmentRequestBody requestBody,
    required String token,
  }) async {
    try {
      await _webServices.storeAppointment(requestBody: requestBody, token: token);
    } catch (error) {
      rethrow;
    }
  }
}