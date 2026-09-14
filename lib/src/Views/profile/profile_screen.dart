import 'package:agentapp/src/Controllers/profile/profile_controller.dart';
import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/constants/app_strings.dart';
import 'package:agentapp/src/helper/app_alerts.dart';
import 'package:agentapp/src/helper/app_buttom_sheet.dart';
import 'package:agentapp/src/widgets/body_widget.dart';
import 'package:agentapp/src/widgets/custom_appbar.dart';
import 'package:agentapp/src/widgets/custom_button.dart';
import 'package:agentapp/src/widgets/custom_header_sheet.dart';
import 'package:agentapp/src/widgets/custom_input.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    final ProfileController profileController = Get.put(ProfileController());
    return BodyWidget(
      scafoldBody: Scaffold(
        appBar: CustomAppbar(
          title: "Profile",
          showBtn: true,
          showBtnAction: false,
          centerTitle: false,
          icon: Icons.person,
        ),
        body: ListView(
          children: [
            SizedBox(height: h * 0.02),
            Card(
              margin: EdgeInsets.zero,
              color: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(
                  color: AppColors.greyColor.withValues(alpha: 0.3),
                ),
              ),
              elevation: 0.0,
              child: ListTile(
                leading: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    title: "ME",
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.blackColor,
                  ),
                ),
                title: CustomText(
                  title: "Mouhcine Elbadssi",
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
                subtitle: CustomText(
                  title: "mouhcine.elbadssi@gmail.com",
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: AppColors.blackColor,
                ),
                trailing: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: AppColors.orangeColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.edit,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            CustomText(
              title: "Paramétres",
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 5.0),
            Card(
              margin: EdgeInsets.zero,
              color: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(
                  color: AppColors.greyColor.withValues(alpha: 0.3),
                ),
              ),
              elevation: 0.0,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      profileController.currentPasswordController.clear();
                      profileController.newPasswordController.clear();
                      AppButtomSheet.showButtomSheet(
                        child: SizedBox(
                          width: w,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomHeaderSheet(
                                title: "Changement de mot de passe",
                                onTap: () => Get.back(),
                              ).paddingAll(AppString.horizontalPadding),
                              SizedBox(height: 10.0),
                              CustomInput(
                                myController:
                                    profileController.currentPasswordController,
                                maxLines: 1,
                                hint: "Mot de passe actuel",
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                                icon: Icons.lock_rounded,
                              ).paddingSymmetric(
                                  horizontal: AppString.horizontalPadding),
                              SizedBox(height: 10.0),
                              CustomInput(
                                myController:
                                    profileController.newPasswordController,
                                maxLines: 1,
                                hint: "Nouveau mot de passe",
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                icon: Icons.lock_rounded,
                              ).paddingSymmetric(
                                  horizontal: AppString.horizontalPadding),
                              SizedBox(height: 20.0),
                              CustomButton(
                                onPressed: () {
                                  if (profileController
                                          .currentPasswordController
                                          .text
                                          .isNotEmpty &&
                                      profileController.newPasswordController
                                          .text.isNotEmpty) {
                                    Get.back();
                                    profileController.changePassword();
                                  } else {
                                    profileController.changePassword();
                                  }
                                },
                                bgColorButton: AppColors.primaryColor,
                                title: "Confirmer",
                                colorText: AppColors.whiteColor,
                              ).paddingSymmetric(
                                  horizontal: AppString.horizontalPadding),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        ),
                      );
                    },
                    leading: Icon(
                      Icons.password_rounded,
                      color: AppColors.primaryColor,
                    ),
                    title: CustomText(
                      title: "Changement de mot de passe",
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.blackColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.blackColor,
                      size: 18.0,
                    ),
                  ),
                  Divider(
                    height: 0.0,
                    color: AppColors.greyColor.withValues(alpha: 0.3),
                    endIndent: 40.0,
                  ),
                  ListTile(
                    onTap: () {
                      AppAlerts.customGlobalAlert(
                        context: context,
                        colorButton: AppColors.errorColor,
                        title: "Déconnexion",
                        content: "Voulez-vous vraiment vous déconnecter ?",
                        titleBtn: "Oui",
                        onPressed: () {
                          Get.back();
                          profileController.logOut();
                        },
                      );
                    },
                    leading: Icon(
                      Icons.logout_rounded,
                      color: AppColors.errorColor,
                    ),
                    title: CustomText(
                      title: "Déconnexion",
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.errorColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.errorColor,
                      size: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: AppString.horizontalPadding),
      ),
    );
  }
}
