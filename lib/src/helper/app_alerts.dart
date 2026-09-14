import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/widgets/custom_button.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AppAlerts {
  static void customGlobalAlert({
    required BuildContext context,
    required String title,
    required String content,
    required String titleBtn,
    required void Function()? onPressed,
    required Color colorButton,
  }) {
    Get.dialog(
      barrierColor: AppColors.blackColor.withValues(alpha: 0.7),
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: AppColors.whiteColor,
        title: MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: CustomText(
            title: title,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
            textAlign: TextAlign.center,
          ),
        ),
        content: MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: CustomText(
            title: content,
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: AppColors.blackColor,
            textAlign: TextAlign.center,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          CustomButton(
            onPressed: onPressed,
            bgColorButton: colorButton,
            title: titleBtn,
            colorText: AppColors.whiteColor,
          ),
          SizedBox(height: 10.0),
          CustomButton(
            onPressed: () => Get.back(),
            bgColorButton: AppColors.greyColor.withValues(alpha: 0.2),
            title: "Annuler",
            colorText: AppColors.blackColor,
          ),
        ],
      ),
    );
  }

  static void customAlertLoading({
    required BuildContext context,
  }) {
    Get.dialog(
      barrierColor: AppColors.blackColor.withValues(alpha: 0.4),
      barrierDismissible: true,
      PopScope(
        canPop: false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: AppColors.whiteColor,
          title: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: Column(
              spacing: 10.0,
              children: [
                CustomText(
                  title: "Chargement en cours",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: SpinKitFadingCircle(
                      color: AppColors.primaryColor,
                      // size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
