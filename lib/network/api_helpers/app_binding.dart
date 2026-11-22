import 'package:get/get.dart';
import 'package:getx_architecture_example/network/api_provider/api_client.dart';

/// Manages the dependency injection for the application.
///
/// This class binds the required dependencies injection system.
class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiClient>(() => ApiClient(), fenix: true);
  }
}
