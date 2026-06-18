import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../datasourse/dataSourse_Auth.dart';
import '../model/login/request_body.dart';
import '../model/login/response_model.dart';
import '../model/signup/sign_up_model.dart';
import '../model/signup/signup_request.dart';


class AuthloginRepo{
  AuthLogindatasourse authlogin;
  AuthloginRepo(this.authlogin);

  Future<Either<Failure, ResponseModel>> login(RequestBody body) async {

    return await authlogin.login(body);
  }
}

class AuthsignupRepo{
  AuthSignupdatasourse authSignup;
  AuthsignupRepo(this.authSignup);

  Future<Either<Failure, SignupModel>> signup(SignupRequestBody body) async {

    return await authSignup.signup(body);
  }
}