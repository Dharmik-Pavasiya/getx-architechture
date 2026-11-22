import 'package:get/get.dart';
import 'package:getx_architecture_example/router/app_routes.dart';

/// This SplashController class manages the splash screen logic.
///
/// It handles navigation after the splash screen delay.
class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _manageNavigateAfterSplash();
  }

  /// Manages navigation after the splash screen delay.
  void _manageNavigateAfterSplash() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed(AppRoutes.homePage),
    );
  }
}
