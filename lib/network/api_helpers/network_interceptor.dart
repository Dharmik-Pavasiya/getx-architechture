import 'package:dio/dio.dart';
import 'package:getx_architecture_example/utils/utils.dart';

/// A custom interceptor for handling network requests and responses.
///
/// This class extends Dio's [Interceptor] and is used to log network requests and responses,
/// handle specific API responses, and manage errors. It allows you to perform actions based on
/// the status of network requests, such as displaying alerts or clearing user data.

class NetworkInterceptor extends Interceptor {
  /// Called whenever a network request is made.
  ///
  /// This method logs details about the request, including the HTTP method, URL, headers,
  /// and request data. It provides visibility into outgoing network requests for debugging purposes.
  ///
  /// [options] contains information about the request being made.
  /// [handler] allows you to continue processing the request or modify it.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Utils.customLog(
      '${options.method} ${options.baseUrl}${options.path}',
    );
    return super.onRequest(options, handler);
  }

  /// Called whenever a response is received.
  ///
  /// This method logs details about the response, including the URL, status code, and response body.
  /// It also handles specific response conditions, such as displaying an alert dialog when certain
  /// API endpoints return specific status codes and data.
  ///
  /// [response] contains the response received from the server.
  /// [handler] allows you to continue processing the response or modify it.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Utils.customLog(
      '${response.statusCode} '
      '${response.requestOptions.baseUrl}${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  /// Called whenever an error occurs during a network request.
  ///
  /// This method logs details about the error, including the status code, status message, and request URL.
  /// It also handles specific error conditions, such as displaying a snack bar or clearing user data
  /// based on the error status code and request URL.
  ///
  /// [err] contains information about the error encountered during the request.
  /// [handler] allows you to continue processing the error or modify it.
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    Utils.customLog(
      '${err.response?.statusCode ?? 'network-error'} '
      '${err.requestOptions.baseUrl}${err.requestOptions.path}',
    );
    if (err.response?.statusCode == 401) {
      logout();
      return super.onError(err, handler);
    } else {
      return super.onError(err, handler);
    }
  }

  Future<void> logout() async {}
}
