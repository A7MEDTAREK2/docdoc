import 'package:docdoc/features/auth/data/model/login/response_model.dart';

import '../data/model/signup/sign_up_model.dart';

class Auth_login_State {}

class AuthInitialState extends Auth_login_State{}

class AuthLoadingState extends Auth_login_State{}

class AuthLoadedState extends Auth_login_State{
  final ResponseModel responseModel;
  AuthLoadedState({required this.responseModel});
}

class AuthErrorState extends Auth_login_State{
  final String message;

  AuthErrorState({required this.message});


}


class StateSignup {}

class SignupInitialState extends StateSignup{}

class SignupLoadingState extends StateSignup{}

class SignupLoadedState extends StateSignup{
  final SignupModel signupModel;
  SignupLoadedState({required this.signupModel});
}

class SignupErrorState extends StateSignup {
  final String message;

  SignupErrorState({required this.message});

}
