import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_example/app/app_colors.dart';
import 'package:getx_architecture_example/app/app_strings.dart';
import 'package:getx_architecture_example/screens/add_user_screen/controller/add_user_controller.dart';
import 'package:getx_architecture_example/screens/add_user_screen/view/widget/add_user_button_widget.dart';
import 'package:getx_architecture_example/widgets/common_app_input.dart';

/// This AddUserView class provides the UI for adding a user.
///
/// It includes input fields for user details and a submit button.
/// Uses GetX's `GetView` to manage controller dependency injection.
class AddUserView extends GetView<AddUserController> {
  const AddUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _mainBody(),
      ),
    );
  }

  /// Builds the app bar widget.
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(AppStrings.addUser),
      centerTitle: true,
    );
  }

  /// Builds the main body of the screen.
  Center _mainBody() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppStrings.plsFillBelowDetailsToAddUser,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          CommonAppInput(
            textEditingController: controller.nameController,
            focusNode: controller.nameNode,
            nextFocusNode: controller.jobNode,
            borderRadius: 10,
            hintText: AppStrings.nameHint,
            hintStyle: const TextStyle(
              color: AppColors.colorFontGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          CommonAppInput(
            textEditingController: controller.jobController,
            focusNode: controller.jobNode,
            borderRadius: 10,
            hintText: AppStrings.jobHint,
            hintStyle: const TextStyle(
              color: AppColors.colorFontGrey,
              fontWeight: FontWeight.w500,
            ),
            onSubmitted: (_) => controller.onAddUser(),
          ),
          const SizedBox(height: 10),
          AddUserButtonWidget(controller: controller),
        ],
      ).marginSymmetric(horizontal: 20),
    );
  }
}
