import 'package:dio/dio.dart';
import 'package:docdoc/features/auth/logic/state.dart';
import 'package:docdoc/features/auth/logic/state_signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/const/const_api.dart';
import '../../../core/service/token.dart';
import '../data/login/response_model.dart';
import '../data/signup/signup_request.dart';

class signupCubit extends Cubit<StateSignup> {
  signupCubit() : super(SignupInitialState());
  final Dio dio = Dio();

  Future<ResponseModel?> signup(SignupRequestBody body) async {
    emit(SignupLoadingState());
    try {
      final response = await dio.post(
        ConstApi.signup,
        data: FormData.fromMap(body.toJson()),
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final token = response.data['data']['token'];
        await TokenStorage.saveToken(token);
        final result = ResponseModel.fromJson(response.data);
        emit(SignupLoadedState());

        return result;
      }
    } catch (e) {
      if (e is DioException) {
        emit(
          SignupErrorState(
            message: e.response?.data.toString() ?? e.toString(),
          ),
        );
      }
    }
  }
}
