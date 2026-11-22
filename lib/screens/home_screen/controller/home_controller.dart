import 'package:get/get.dart';
import 'package:getx_architecture_example/screens/home_screen/data/get_user_list_model.dart';
import 'package:getx_architecture_example/screens/home_screen/data/home_repository.dart';

/// Coordinates the users page while keeping API details out of the view.
class HomeController extends GetxController {
  HomeController(this._repository);

  final HomeRepository _repository;

  final RxList<User> users = <User>[].obs;
  final RxBool isLoading = false.obs;
  final RxnString errorMessage = RxnString();

  @override
  void onReady() {
    super.onReady();
    getUsers();
  }

  Future<void> getUsers() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      users.assignAll(await _repository.getUsers());
    } catch (error) {
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
