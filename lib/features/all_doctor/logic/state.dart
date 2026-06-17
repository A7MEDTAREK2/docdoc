
import '../data/model/model_doctor.dart';

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
//search

class SearchDoctorsLoadingState extends GetDoctorsStates {}

class SearchDoctorsSuccessState extends GetDoctorsStates {
  DoctorsResponse doctorsResponse;
  SearchDoctorsSuccessState({required this.doctorsResponse});
}

class SearchDoctorsErrorState extends GetDoctorsStates {
  String em;
  SearchDoctorsErrorState({required this.em});
}