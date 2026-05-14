
import '../data/model_doctor.dart';

class GetDoctorsStates {}

class GetDoctorsInitialState extends GetDoctorsStates {}

class GetDoctorsLoadingState extends GetDoctorsStates {}

class GetDoctorsSuccessState extends GetDoctorsStates {
  DoctorsResponse doctorsResponse;
  GetDoctorsSuccessState({required this.doctorsResponse});
}

class GetDoctorsErrorState extends GetDoctorsStates {
  String em;
  GetDoctorsErrorState({required this.em});
}