import 'package:docdoc/features/auth/data/model/login/response_model.dart';

class AuthState {}

class AuthInitialState extends AuthState{}

class AuthLoadingState extends AuthState{}

class AuthLoadedState extends AuthState{
  final ResponseModel responseModel;
  AuthLoadedState({required this.responseModel});
}

class AuthErrorState extends AuthState{
  final String message;

  AuthErrorState({required this.message});


}
