import 'package:agentapp/src/Controllers/auth/auth_controller.dart';
import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/constants/app_images.dart';
import 'package:agentapp/src/constants/app_strings.dart';
import 'package:agentapp/src/widgets/body_widget.dart';
import 'package:agentapp/src/widgets/custom_button.dart';
import 'package:agentapp/src/widgets/custom_input.dart';
import 'package:agentapp/src/widgets/custom_loading_button.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final AuthController authController = Get.put(AuthController());
    return BodyWidget(
      scafoldBody: Scaffold(
        body: ListView(
          children: [
            Image.asset(
              AppImages.logoApp,
              width: 100.0,
              height: 120.0,
            ),
            SizedBox(height: 35.0),
            CustomText(
              title: "Se connecter",
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 7.0),
            CustomText(
              title:
                  "Accédez a votre espace pour gérer vos tournées et effectuer vos controles terrain",
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: AppColors.blackColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            Card(
              margin: EdgeInsets.zero,
              elevation: 0.0,
              color: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors.greyColor.withValues(alpha: 0.2),
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: "Email *",
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(height: 5.0),
                    CustomInput(
                      myController: authController.emailController,
                      maxLines: 1,
                      hint: "Entrer votre email",
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      icon: Icons.email,
                    ),
                    SizedBox(height: 10.0),
                    CustomText(
                      title: "Password *",
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(height: 5.0),
                    Obx(
                      () => CustomInput(
                        myController: authController.passwordController,
                        maxLines: 1,
                        hint: "Entrer votre password",
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        icon: Icons.lock,
                        isPassword: true,
                        obscureText: authController.isAbstractPassword.value,
                        onPressed: () => authController.togglePassword(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Obx(
                      () => authController.isLoading.value
                          ? CustomLoadingButton(
                              bgColorButton: AppColors.primaryColor,
                            )
                          : CustomButton(
                              onPressed: () => authController.login(),
                              bgColorButton: AppColors.primaryColor,
                              title: "Connexion",
                              colorText: AppColors.whiteColor,
                            ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h * 0.05),
          ],
        ).paddingSymmetric(horizontal: AppString.horizontalPadding),
      ),
    );
  }
}
