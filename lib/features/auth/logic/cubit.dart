import 'package:docdoc/core/const/const_api.dart';
import 'package:docdoc/features/auth/data/request_body.dart';
import 'package:docdoc/features/auth/data/response_model.dart';
import 'package:docdoc/features/auth/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class LoginCubit extends Cubit <AuthState> {
  LoginCubit() : super(AuthInitialState());
  final Dio dio = Dio();

  Future<ResponseModel?> login (RequestBody body) async{
    try{ final Response = await dio.post(ConstApi.login , data: body.toJson());

      if(Response.statusCode ==200){
        final result = ResponseModel.fromJson(Response.data);
        emit(AuthLoadedState());
       return result;


      }

    } catch (e) {
      emit(AuthErrorState());

    }
  }

}
