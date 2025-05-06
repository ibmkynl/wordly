import 'package:dio/dio.dart';
import 'package:worldy/core/error/failure.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio}) {
    dio.options
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10)
      ..headers = {'Content-Type': 'application/json'};
  }

  Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioException catch (dioError) {
      throw _mapDioErrorToAppError(dioError);
    } catch (_) {
      throw UnknownFailure('An unexpected error occurred. Please try again.');
    }
  }

  Failure _mapDioErrorToAppError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.receiveTimeout) {
      return NetworkFailure('Connection timed out. Please check your internet and try again.');
    } else if (error.type == DioExceptionType.badResponse) {
      final statusCode = error.response?.statusCode ?? 0;
      if (statusCode == 404) {
        return NotFoundFailure('Searched word not found.');
      } else if (statusCode >= 400 && statusCode < 500) {
        return ServerFailure('Client error: $statusCode. Please verify your request.');
      } else if (statusCode >= 500) {
        return ServerFailure('Server error: $statusCode. Please try again later.');
      }
      return ServerFailure('Unexpected server response. Please try again.');
    } else if (error.type == DioExceptionType.unknown) {
      return NetworkFailure('No internet connection. Please connect and try again.');
    } else {
      return UnknownFailure('Something went wrong. Please try again.');
    }
  }
}
