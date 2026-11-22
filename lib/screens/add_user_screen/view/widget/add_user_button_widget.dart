import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_example/app/app_colors.dart';
import 'package:getx_architecture_example/app/app_strings.dart';
import 'package:getx_architecture_example/screens/add_user_screen/controller/add_user_controller.dart';

/// This AddUserButtonWidget class represents a button for adding a user.
///
/// It triggers the add user functionality using the provided controller.
/// Uses an `ElevatedButton` with custom styling.
class AddUserButtonWidget extends StatelessWidget {
  const AddUserButtonWidget({super.key, required this.controller});

  final AddUserController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed:
            controller.isSubmitting.value ? null : () => controller.onAddUser(),
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: const BorderSide(color: AppColors.colorBlack),
            ),
          ),
        ),
        child: controller.isSubmitting.value
            ? const SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Text(
                AppStrings.add,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ).marginSymmetric(horizontal: 20, vertical: 5),
      ),
    );
  }
}
