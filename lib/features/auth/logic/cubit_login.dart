import 'package:docdoc/features/auth/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/login/request_body.dart';
import '../data/repo/repo_login.dart';

class LoginCubit extends Cubit<AuthState> {
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



