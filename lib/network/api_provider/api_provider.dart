import 'package:dio/dio.dart';
import 'package:getx_architecture_example/network/api_helpers/network_interceptor.dart';
import 'package:getx_architecture_example/network/connectivity/network_connectivity.dart';
import '../../app/app_strings.dart';
import '../api_helpers/network_exception.dart';

typedef ConnectivityCheck = Future<bool> Function();

/// A class for managing API requests using Dio.
///
/// This class provides a set of methods to perform network requests using Dio.
/// It handles GET, POST, PUT, DELETE, and multipart requests and manages
/// different API clients. It also
/// handles network connectivity checks and throws appropriate exceptions
/// when errors occur.
abstract class BaseApiClient {
  BaseApiClient(
    String baseUrl, {
    Dio? dioClient,
    ConnectivityCheck? connectivityCheck,
  })  : dio = dioClient ??
            Dio(
              BaseOptions(
                responseType: ResponseType.json,
                baseUrl: baseUrl,
                connectTimeout: const Duration(seconds: 20),
              ),
            ),
        _connectivityCheck =
            connectivityCheck ?? NetworkConnectivity().checkInternet {
    dio.interceptors.add(NetworkInterceptor());
  }

  final Dio dio;
  final ConnectivityCheck _connectivityCheck;

  /// Sends a GET request to the specified API URL.
  ///
  /// This method performs a GET request using the `dio` client, with optional
  /// query parameters and headers. It checks for internet connectivity before
  /// making the request and throws an exception if connectivity is not available.
  ///
  /// [apiUrl] is the endpoint URL for the GET request.
  /// [headers] are the headers to include in the request.
  /// [query] are optional query parameters to include in the request.
  ///
  /// Returns the response data in JSON format.
  Future<dynamic> get({
    required String apiUrl,
    required Map<String, String> headers,
    Map<String, String>? query,
  }) async {
    if (await _connectivityCheck()) {
      try {
        final response = await dio.get(apiUrl,
            options: Options(headers: headers), queryParameters: query);
        return response.data;
      } on DioException catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  /// Sends a POST request to the specified API URL.
  Future<dynamic> post({
    required String apiUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Map<String, String>? query,
  }) async {
    if (await _connectivityCheck()) {
      try {
        final response = await dio.post(
          apiUrl,
          data: params,
          options: Options(headers: headers),
          queryParameters: query,
        );
        return response.data;
      } on DioException catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  /// Sends a POST Multipart request with multipart data to the specified API URL.
  Future<dynamic> postMultipart({
    required String apiUrl,
    FormData? data,
    Map<String, String>? headers,
  }) async {
    if (await _connectivityCheck()) {
      try {
        final response = await dio.post(apiUrl,
            data: data, options: Options(headers: headers));
        return response.data;
      } on DioException catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  /// Sends a PATCH request to the specified API URL.
  Future<dynamic> patch({
    required String apiUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Map<String, String>? query,
  }) async {
    if (await _connectivityCheck()) {
      try {
        final response = await dio.patch(
          apiUrl,
          data: params,
          options: Options(headers: headers),
          queryParameters: query,
        );
        return response.data;
      } on DioException catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  /// Sends a PATCH Multipart request to the specified API URL.
  Future<dynamic> patchMultipart({
    required String apiUrl,
    FormData? data,
    Map<String, String>? headers,
  }) async {
    if (await _connectivityCheck()) {
      try {
        final response = await dio.patch(
          apiUrl,
          data: data,
          options: Options(headers: headers),
        );
        return response.data;
      } on DioException catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  /// Sends a DELETE request to the specified API URL.
  Future<dynamic> delete({
    required String apiUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    if (await _connectivityCheck()) {
      try {
        final response = await dio.delete(
          apiUrl,
          options: Options(headers: headers),
          queryParameters: query,
        );
        return response.data;
      } on DioException catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  /// Sends a PUT request to the specified API URL.
  Future<dynamic> put({
    required String apiUrl,
    Map<String, String>? headers,
    required Map<String, dynamic> params,
    Map<String, String>? query,
  }) async {
    if (await _connectivityCheck()) {
      try {
        final response = await dio.put(
          apiUrl,
          data: params,
          options: Options(headers: headers),
          queryParameters: query,
        );
        return response.data;
      } on DioException catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  /// Sends a Post multipart patch request to the specified API URL.
  Future<dynamic> postMultipartPatch({
    required String apiUrl,
    FormData? data,
    Map<String, String>? headers,
  }) async {
    if (await _connectivityCheck()) {
      try {
        final response = await dio.patch(apiUrl,
            data: data, options: Options(headers: headers));
        return response.data;
      } on DioException catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
    } else {
      throw AppStrings.noInternetConnection;
    }
  }
}
