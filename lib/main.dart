import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_architecture_example/router/app_pages.dart';
import 'package:getx_architecture_example/router/app_routes.dart';
import 'package:getx_architecture_example/app/app_strings.dart';
import 'package:getx_architecture_example/network/api_helpers/app_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.splashPage,
      getPages: AppPages.getPages,
    );
  }
}
