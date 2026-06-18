import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/appointment_model.dart';
import '../data/model/store_appointment_request_body.dart';
import '../data/repo/appointment_repo.dart';
import '_state.dart';


class AppointmentCubit extends Cubit<AppointmentStates> {
  final AppointmentRepo _repo = AppointmentRepo();

  AppointmentCubit() : super(AppointmentInitialState());

  // لستة هنخزن فيها الحجوزات عشان
  List<AppointmentModel> myAppointments = [];

  // 1. ميثود جلب الحجوزات من السيرفر
  Future<void> getMyAppointments({required String token}) async {
    emit(GetAppointmentsLoadingState());

    try {
      final responseModel = await _repo.getAllAppointments(token);

      if (responseModel.status == true) {
        myAppointments = responseModel.data ?? [];
        emit(GetAppointmentsSuccessState(myAppointments));
      } else {
        emit(GetAppointmentsErrorState(responseModel.message ?? "Error"));
      }
    } catch (e) {
      emit(GetAppointmentsErrorState(e.toString()));
    }
  }

  // 2. ميثود إرسال حجز جديد للسيرفر
  Future<void> createAppointment({
    required int doctorId,
    required String startTime,
    required String token,
  }) async {
    emit(StoreAppointmentLoadingState());

    try {
      // جهزنا الـ Request Body اللي عملناه مع بعض
      final requestBody = StoreAppointmentRequestBody(
        doctorId: doctorId,
        startTime: startTime,
      );

      await _repo.storeAppointment(requestBody: requestBody, token: token);

      emit(StoreAppointmentSuccessState());

      getMyAppointments(token: token);
    } catch (e) {
      emit(StoreAppointmentErrorState(e.toString()));
    }
  }
}