class StateSignup {}

class SignupInitialState extends StateSignup{}

class SignupLoadingState extends StateSignup{}

class SignupLoadedState extends StateSignup{}

class SignupErrorState extends StateSignup {
  final String message;

  SignupErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}