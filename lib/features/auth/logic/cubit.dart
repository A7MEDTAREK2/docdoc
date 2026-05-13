import 'package:docdoc/core/const/const_api.dart';
import 'package:docdoc/features/auth/data/login/request_body.dart';
import 'package:docdoc/features/auth/data/login/response_model.dart';
import 'package:docdoc/features/auth/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../core/service/token.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit() : super(AuthInitialState());
  final Dio dio = Dio();

  Future login(RequestBody body) async {
    emit(AuthLoadingState());
    try {
      final Response = await dio.post(ConstApi.login, data: body.toJson());

      if (Response.statusCode == 200) {
        final token = Response.data['data']['token'];
        await TokenStorage.saveToken(token);
        emit(AuthLoadedState());
      }
    } catch (e) {
      emit(AuthErrorState(message: 'faild'));
      print("==========Login Error $e");
    }
  }
}
