import 'package:dio/dio.dart';

import 'failure.dart';

class ServerFailure extends Failure {
  const ServerFailure(String message, {int? statusCode})
      : super(message, statusCode: statusCode);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout');

      case DioExceptionType.sendTimeout:
        return const ServerFailure('Request timeout');

      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Server not responding');

      case DioExceptionType.badResponse:
        return ServerFailure(
          e.response?.data['message'] ?? 'Bad response',
          statusCode: e.response?.statusCode,
        );

      case DioExceptionType.cancel:
        return const ServerFailure('Request cancelled');

      default:
        return const ServerFailure('Unexpected error occurred');
    }
  }
}