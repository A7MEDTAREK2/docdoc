import 'package:dio/dio.dart';
import 'package:docdoc/core/const/const_api.dart';
import '../model/store_appointment_request_body.dart';

class AppointmentWebServices {
  final Dio _dio = Dio();

  // 1. جلب الحجوزات (GET)
  Future<Map<String, dynamic>> getAllAppointments(String token) async {
    try {
      final response = await _dio.get(
        ConstApi.appointment,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // 2. حجز موعد جديد (POST)
  Future<Map<String, dynamic>> storeAppointment({
    required StoreAppointmentRequestBody requestBody,
    required String token,
  }) async {
    try {
      final response = await _dio.post(
        ConstApi.store,
        data: requestBody.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}