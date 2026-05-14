import 'dart:math';

import 'package:dio/dio.dart';
import 'package:docdoc/core/service/token.dart';
import 'package:docdoc/features/all_doctor/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docdoc/core/const/const_api.dart';

import '../data/model_doctor.dart';


class DoctorCubit extends Cubit <GetDoctorsStates> {
  DoctorCubit() : super(GetDoctorsInitialState());
  final Dio dio = Dio();

  Future GetDoctor() async {
    emit(GetDoctorsLoadingState());

    try {
      final token = await TokenStorage.getToken();
      final response = await dio.get(ConstApi.GetDOC
        , options: Options(headers: {
          "Authorization": "Bearer $token"}),);
      if(response.statusCode == 200){
        final result = DoctorsResponse.fromJson(response.data);
        emit(GetDoctorsSuccessState(doctorsResponse: result));

      }
      } catch(e) {
      emit(GetDoctorsErrorState(em: e.toString()));


      }
      }


}