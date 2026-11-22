import 'package:dio/dio.dart';

/// A class for handling network-related exceptions.
///
/// This class implements the [Exception] interface and provides custom error messages
/// based on the type of network error encountered using the Dio HTTPS client. It maps
/// Dio's error types and status codes to human-readable error messages.
class NetworkExceptions implements Exception {
  late String message;

  @override
  String toString() => message;

  /// Creates an instance of [NetworkExceptions] based on the given [DioException].
  ///
  /// This constructor initializes the [message] property by analyzing the [dioError]
  /// object and setting an appropriate error message based on the error type and status code.
  NetworkExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Cancel Request';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection Error';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive Timeout';
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
            dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send Timeout';
        break;
      case DioExceptionType.unknown:
        if ((dioError.message ?? '').contains('Socket')) {
          message = 'Socket Exception';
          break;
        }
        message = 'Unexpected Error';
        break;
      default:
        message = 'Unknown Error';
        break;
    }
  }

  /// Handles error messages based on HTTPS status codes and error details.
  ///
  /// This method translates specific HTTPS status codes and error details into
  /// user-friendly error messages.
  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['message'] ?? 'Bad Request';
      case 401:
        return error['message'] ?? 'Bad Request';
      case 403:
        return 'Forbidden';
      case 404:
        return '404';
      case 407:
        return 'InActive';
      case 422:
        return 'Duplicate Email';
      case 500:
        return 'Internal Server Error';
      case 502:
        return 'Bad Gateway';
      default:
        return 'Unknown Error';
    }
  }
}
