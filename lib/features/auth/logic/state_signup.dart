import '../data/model/signup/sign_up_model.dart';

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