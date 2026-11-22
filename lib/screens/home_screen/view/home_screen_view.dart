import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_example/app/app_strings.dart';
import 'package:getx_architecture_example/router/app_routes.dart';
import 'package:getx_architecture_example/screens/home_screen/controller/home_controller.dart';
import 'package:getx_architecture_example/screens/home_screen/view/widget/home_screen_card_widget.dart';

/// Users page demonstrating GetView and reactive Obx rendering.
class HomeScreenView extends GetView<HomeController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.homePage),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addUserPage),
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final error = controller.errorMessage.value;
        if (error != null) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(error, textAlign: TextAlign.center),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: controller.getUsers,
                  child: const Text(AppStrings.retry),
                ),
              ],
            ).paddingAll(24),
          );
        }

        if (controller.users.isEmpty) {
          return const Center(child: Text(AppStrings.noUsersFound));
        }

        return RefreshIndicator(
          onRefresh: controller.getUsers,
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: controller.users.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, index) {
              return HomeScreenCardWidget(user: controller.users[index]);
            },
          ),
        );
      }),
    );
  }
}
