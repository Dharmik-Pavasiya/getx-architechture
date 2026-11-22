import 'package:get/get.dart';
import 'package:getx_architecture_example/router/app_routes.dart';
import 'package:getx_architecture_example/screens/add_user_screen/binding/add_user_binding.dart';
import 'package:getx_architecture_example/screens/add_user_screen/view/add_user_view.dart';
import 'package:getx_architecture_example/screens/home_screen/binding/home_binding.dart';
import 'package:getx_architecture_example/screens/home_screen/view/home_screen_view.dart';
import 'package:getx_architecture_example/screens/splash_screen/binding/splash_binding.dart';
import 'package:getx_architecture_example/screens/splash_screen/view/splash_screen_view.dart';

/// This AppPages class defines all the routes used in the application.
///
/// It manages navigation transitions and route bindings.
class AppPages {
  /// Default transition effect for navigation.
  static Transition transition = Transition.fade;

  /// Default transition duration for navigation.
  static Duration transitionDuration = const Duration(milliseconds: 350);

  /// List of all application pages with their routes, bindings, and transitions.
  static final List<GetPage> getPages = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => const SplashScreenView(),
      binding: SplashBinding(),
      transition: transition,
      transitionDuration: transitionDuration,
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomeScreenView(),
      binding: HomeBinding(),
      transition: transition,
      transitionDuration: transitionDuration,
    ),
    GetPage(
      name: AppRoutes.addUserPage,
      page: () => const AddUserView(),
      binding: AddUserBinding(),
      transition: transition,
      transitionDuration: transitionDuration,
    ),
  ];
}
