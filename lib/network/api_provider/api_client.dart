import 'package:dio/dio.dart';
import 'package:getx_architecture_example/utils/env_config.dart';

import 'api_provider.dart';

/// A class for managing API requests for general use cases.
///
/// This class extends [BaseApiClient] and is configured with the base URL
/// for general API requests. It provides methods to perform various types of
/// HTTPS requests, including GET, POST, PUT, DELETE, and multipart requests.
class ApiClient extends BaseApiClient {
  ApiClient({
    Dio? dio,
    super.connectivityCheck,
  }) : super(
          EnvConfig.baseUrl,
          dioClient: dio,
        );
}
