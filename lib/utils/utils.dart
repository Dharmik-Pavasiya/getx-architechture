import 'package:get/get.dart';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_architecture_example/app/app_colors.dart';
import 'package:getx_architecture_example/app/app_strings.dart';

/// This Utils class provides utility methods for logging and displaying snackbars.
class Utils {
  Utils._();

  /// Logs messages in debug mode.
  static void customLog(String message) {
    if (kDebugMode) {
      return dev.log(message, name: 'Logs:');
    }
  }

  /// Displays a common snackBar with a success or error message.
  static void commonSnackBar(String msg, bool isSuccess) {
    Get.closeAllSnackbars();

    Get.snackbar(
      isSuccess ? AppStrings.success : AppStrings.error,
      msg,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(5),
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      forwardAnimationCurve: Curves.easeInOutCubic,
      backgroundColor: isSuccess ? AppColors.colorGreen : AppColors.colorRed,
      colorText: AppColors.colorWhite,
    );
  }
}
