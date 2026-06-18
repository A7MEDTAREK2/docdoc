import 'package:docdoc/features/auth/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/login/request_body.dart';
import '../data/model/signup/signup_request.dart';
import '../data/repo/repo_Auth.dart';

class LoginCubit extends Cubit<Auth_login_State> {
  AuthloginRepo authloginRepo;
  LoginCubit(this.authloginRepo) : super(AuthInitialState());

  Future login(RequestBody body) async {
    emit(AuthLoadingState());

  final result = await authloginRepo.login(body);
    result.fold(
          (failure) => emit(AuthErrorState(message: failure.message)),
          (response)=> emit(AuthLoadedState(responseModel: response)),
    );



  }

}

class signupCubit extends Cubit<StateSignup> {
  AuthsignupRepo authsignupRepo;
  signupCubit(this.authsignupRepo) : super(SignupInitialState());

  Future<void> signup(SignupRequestBody body) async {
    emit(SignupLoadingState());

    final result = await authsignupRepo.signup(body);
    result.fold(
          (failure) => emit(SignupErrorState(message:  failure.message)),
          (response)=> emit(SignupLoadedState(signupModel: response)),
    );






  }
}



