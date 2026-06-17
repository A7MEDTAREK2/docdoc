import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../datasourse/data_signup.dart';
import '../model/signup/sign_up_model.dart';
import '../model/signup/signup_request.dart';

class AuthsignupRepo{
  AuthSignupdatasourse authSignup;
  AuthsignupRepo(this.authSignup);

Future<Either<Failure, SignupModel>> signup(SignupRequestBody body) async {

  return await authSignup.signup(body);
}
}