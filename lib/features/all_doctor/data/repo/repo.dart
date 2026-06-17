import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../data_sours/data.dart';
import '../model/model_doctor.dart';

class Getrepo {
  final GetDataSource getDataSource;
  Getrepo(this.getDataSource);

  Future<Either<Failure, DoctorsResponse>> getdoctor() async {
    return await getDataSource.getdoctor();

  }

  Future<Either<Failure, DoctorsResponse>> searchDoctor(String name) async {
    return await getDataSource.searchDoctor(name);
  }
}