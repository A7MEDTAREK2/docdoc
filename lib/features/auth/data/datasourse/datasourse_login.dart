import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/core/error/failure.dart';

import '../../../../core/const/const_api.dart';
import '../../../../core/error/server_failure.dart';
import '../../../../core/service/token.dart';
import '../model/login/request_body.dart';
import '../model/login/response_model.dart';

abstract class AuthLogindatasourse {
  Future<Either<Failure, ResponseModel>> login(RequestBody body);
}

class LoginImp implements AuthLogindatasourse {
  final Dio dio;

  LoginImp(this.dio);

  @override
  Future<Either<Failure, ResponseModel>> login(RequestBody body) async {
    try {
      final response = await dio.post(ConstApi.login, data: body.toJson());
      final responseModel = ResponseModel.fromJson(response.data);
      final token = responseModel.data.token;
      await TokenStorage.saveToken(token);
return right(responseModel);

    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }
  }

