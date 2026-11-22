import 'package:get/get.dart';
import 'package:getx_architecture_example/network/api_provider/api_client.dart';
import 'package:getx_architecture_example/screens/add_user_screen/controller/add_user_controller.dart';
import 'package:getx_architecture_example/screens/add_user_screen/data/add_user_repository.dart';

/// This AddUserBinding class is responsible for binding dependencies for adding a user.
///
/// It ensures that the AddUserController is lazily initialized when needed.
/// Extends Bindings from GetX for dependency management.
class AddUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUserRepository>(
      () => ApiAddUserRepository(Get.find<ApiClient>()),
    );
    Get.lazyPut(() => AddUserController(Get.find<AddUserRepository>()));
  }
}
