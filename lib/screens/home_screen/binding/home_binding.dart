import 'package:get/get.dart';
import 'package:getx_architecture_example/network/api_provider/api_client.dart';
import 'package:getx_architecture_example/screens/home_screen/controller/home_controller.dart';
import 'package:getx_architecture_example/screens/home_screen/data/home_repository.dart';

/// This HomeBinding class is responsible for binding dependencies for the home screen.
///
/// It ensures that the `HomeController` is lazily initialized when needed.
/// Extends `Bindings` from GetX for dependency management.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(
      () => ApiHomeRepository(Get.find<ApiClient>()),
    );
    Get.lazyPut(() => HomeController(Get.find<HomeRepository>()));
  }
}
