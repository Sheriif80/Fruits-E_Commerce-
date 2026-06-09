import 'package:dio/dio.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';

class ApiErrorHandler {
  static Failures handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return ServerFailure('Something went wrong, please try again later.');
    }
  }

  static Failures _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with API server');
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected error occurred');
    }
  }

  static Failures _handleBadResponse(Response? response) {
    if (response != null && response.data != null) {
      // You can customize this based on your API response structure
      // For Gemini, errors might be in response.data['error']['message']
      final dynamic errorData = response.data;
      if (errorData is Map && errorData.containsKey('error')) {
        final error = errorData['error'];
        if (error is Map && error.containsKey('message')) {
          return ServerFailure(error['message']);
        }
      }
    }

    switch (response?.statusCode) {
      case 400:
        return ServerFailure('Bad request');
      case 401:
        return ServerFailure('Unauthorized');
      case 403:
        return ServerFailure('Forbidden');
      case 404:
        return ServerFailure('Not found');
      case 500:
        return ServerFailure('Internal server error');
      default:
        return ServerFailure('Something went wrong');
    }
  }
}
