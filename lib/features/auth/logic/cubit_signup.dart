import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/features/auth/data/repo/repo_signup.dart';
import 'package:docdoc/features/auth/logic/state.dart';
import 'package:docdoc/features/auth/logic/state_signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/failure.dart';
import '../data/model/signup/sign_up_model.dart';
import '../data/model/signup/signup_request.dart';

class signupCubit extends Cubit<StateSignup> {
  AuthsignupRepo authsignupRepo;
  signupCubit(this.authsignupRepo) : super(SignupInitialState());

  Future signup(SignupRequestBody body) async {
    emit(SignupLoadingState());

    final result = await authsignupRepo.signup(body);
    result.fold(
          (failure) => emit(SignupErrorState(message:  failure.message)),
          (response)=> emit(SignupLoadedState(signupModel: response)),
    );






  }
}
