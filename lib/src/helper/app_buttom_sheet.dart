import 'package:agentapp/src/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButtomSheet {
  static void showButtomSheet({required Widget child}) {
    Get.bottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      isScrollControlled: true,
      child,
    );
  }
}
