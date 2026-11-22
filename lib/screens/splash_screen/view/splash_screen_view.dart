import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_example/app/app_strings.dart';
import 'package:getx_architecture_example/screens/splash_screen/controller/splash_controller.dart';

class SplashScreenView extends GetView<SplashController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.account_tree_outlined, size: 96),
            SizedBox(height: 16),
            Text(
              AppStrings.appName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
