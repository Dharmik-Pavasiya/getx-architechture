import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_example/app/app_strings.dart';
import 'package:getx_architecture_example/router/app_routes.dart';
import 'package:getx_architecture_example/screens/add_user_screen/data/add_user_repository.dart';
import 'package:getx_architecture_example/utils/utils.dart';

class AddUserController extends GetxController {
  AddUserController(this._repository);

  final AddUserRepository _repository;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final FocusNode nameNode = FocusNode();
  final FocusNode jobNode = FocusNode();
  final RxBool isSubmitting = false.obs;

  Future<void> onAddUser() async {
    final validationMessage = _validationMessage();
    if (validationMessage != null) {
      Utils.commonSnackBar(validationMessage, false);
      return;
    }

    isSubmitting.value = true;
    try {
      await _repository.addUser(
        name: nameController.text.trim(),
        job: jobController.text.trim(),
      );
      Utils.commonSnackBar(AppStrings.userAddedSuccessfully, true);
      Get.offAllNamed(AppRoutes.homePage);
    } catch (error) {
      Utils.commonSnackBar(error.toString(), false);
    } finally {
      isSubmitting.value = false;
    }
  }

  String? _validationMessage() {
    if (nameController.text.trim().isEmpty) {
      return AppStrings.plsEnterName;
    }
    if (jobController.text.trim().isEmpty) {
      return AppStrings.plsEnterJob;
    }
    return null;
  }

  @override
  void onClose() {
    nameController.dispose();
    jobController.dispose();
    nameNode.dispose();
    jobNode.dispose();
    super.onClose();
  }
}
