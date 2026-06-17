import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/repo.dart';
import 'state.dart';

class DoctorCubit extends Cubit<GetDoctorsStates> {
  final Getrepo getrepo;

  DoctorCubit(this.getrepo) : super(GetDoctorsInitialState());

  Future<void> getDoctor() async {
    emit(GetDoctorsLoadingState());

    final result = await getrepo.getdoctor();

    result.fold(
          (failure) {
        emit(GetDoctorsErrorState(em: failure.message));
      },
          (data) {
        emit(GetDoctorsSuccessState(doctorsResponse: data));
      },
    );
  }
  Future<void> searchDoctor(String name) async {
    print("SEARCH REQUEST: $name");

    emit(SearchDoctorsLoadingState());

    final result = await getrepo.searchDoctor(name);

    result.fold(
          (failure) {
        print("SEARCH ERROR: ${failure.message}");

        emit(
          SearchDoctorsErrorState(
            em: failure.message,
          ),
        );
      },
          (data) {
        print("SEARCH SUCCESS");
        print("DOCTORS COUNT = ${data.data.length}");

        emit(
          SearchDoctorsSuccessState(
            doctorsResponse: data,
          ),
        );
      },
    );
  }
}