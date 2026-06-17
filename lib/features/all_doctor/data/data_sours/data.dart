import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/core/error/server_failure.dart';
import '../../../../core/const/const_api.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/service/token.dart';
import '../model/model_doctor.dart';

abstract class GetDataSource {
  Future<Either<Failure, DoctorsResponse>> getdoctor();
  Future<Either<Failure, DoctorsResponse>> searchDoctor(String name);
}

class GetDocoImpl implements GetDataSource {
  final Dio dio;
  GetDocoImpl(this.dio);

  @override
  Future<Either<Failure, DoctorsResponse>> getdoctor() async {
    try {
      final token = await TokenStorage.getToken();
      final response = await dio.get(
        ConstApi.GetDOC,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      final result = DoctorsResponse.fromJson(response.data);
      return right(result);
    }
    on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, DoctorsResponse>> searchDoctor(String name)async {
    try {
      final token = await TokenStorage.getToken();
      final response = await dio.get(
        ConstApi.SearchDoc(name),
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      final result = DoctorsResponse.fromJson(response.data);
      return right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }

}



