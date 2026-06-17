import 'package:dartz/dartz.dart';
import 'package:docdoc/features/auth/data/datasourse/datasourse_login.dart';

import '../../../../core/error/failure.dart';
import '../model/login/request_body.dart';
import '../model/login/response_model.dart';


class AuthloginRepo{
  AuthLogindatasourse authlogin;
  AuthloginRepo(this.authlogin);

  Future<Either<Failure, ResponseModel>> login(RequestBody body) async {

    return await authlogin.login(body);
  }
}