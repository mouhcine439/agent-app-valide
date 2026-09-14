import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';

class AppToastNotifiactions {
  static void toastNotificationSuccess({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    ElegantNotification.success(
      background: AppColors.whiteColor,
      width: MediaQuery.of(context).size.width * 0.95,
      toastDuration: const Duration(seconds: 2),
      position: Alignment.topLeft,
      animation: AnimationType.fromLeft,
      title: CustomText(
        title: title,
        fontSize: 17 / MediaQuery.of(context).textScaler.scale(1.0),
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
      description: CustomText(
        title: content,
        fontSize: 15 / MediaQuery.of(context).textScaler.scale(1.0),
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      onDismiss: () {},
    ).show(context);
  }

  static void toastNotificationError({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    ElegantNotification.error(
      background: AppColors.whiteColor,
      width: MediaQuery.of(context).size.width * 0.95,
      toastDuration: const Duration(seconds: 2),
      position: Alignment.topLeft,
      animation: AnimationType.fromLeft,
      title: CustomText(
        title: title,
        fontSize: 17 / MediaQuery.of(context).textScaler.scale(1.0),
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
      description: CustomText(
        title: content,
        fontSize: 15 / MediaQuery.of(context).textScaler.scale(1.0),
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      onDismiss: () {},
    ).show(context);
  }

  static void toastNotificationWarning({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    ElegantNotification(
      icon: Icon(
        Icons.warning,
        color: AppColors.orangeColor,
      ),
      background: AppColors.whiteColor,
      width: MediaQuery.of(context).size.width * 0.95,
      toastDuration: const Duration(seconds: 2),
      position: Alignment.topLeft,
      animation: AnimationType.fromLeft,
      title: CustomText(
        title: title,
        fontSize: 17 / MediaQuery.of(context).textScaler.scale(1.0),
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
      description: CustomText(
        title: content,
        fontSize: 15 / MediaQuery.of(context).textScaler.scale(1.0),
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      onDismiss: () {},
    ).show(context);
  }
}
