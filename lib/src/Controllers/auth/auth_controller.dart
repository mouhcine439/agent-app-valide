import 'dart:convert';
import 'dart:developer';

import 'package:agentapp/src/constants/app_strings.dart';
import 'package:agentapp/src/helper/app_local.dart';
import 'package:agentapp/src/helper/app_toast_notifications.dart';
import 'package:agentapp/src/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _remmemberMe();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void _remmemberMe() async {
    if (await AppLocal.readDataLocal(key: 'email') != '' &&
        await AppLocal.readDataLocal(key: 'password') != '') {
      emailController.text = await AppLocal.readDataLocal(key: 'email');
      passwordController.text = await AppLocal.readDataLocal(key: 'password');
    }
  }

  RxBool isLoading = false.obs;
  Future<void> login() async {
    if (emailController.text.isEmpty) {
      AppToastNotifiactions.toastNotificationWarning(
        context: Get.overlayContext!,
        title: "Attention",
        content: "Veuillez saisir votre email",
      );
      return;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      AppToastNotifiactions.toastNotificationWarning(
        context: Get.overlayContext!,
        title: "Attention",
        content: "Veuillez saisir un email valide",
      );
      return;
    }
    if (passwordController.text.isEmpty) {
      AppToastNotifiactions.toastNotificationWarning(
        context: Get.overlayContext!,
        title: "Attention",
        content: "Veuillez saisir votre mot de passe",
      );
      return;
    }
    try {
      isLoading.value = true;
      Uri url = Uri.parse('${AppString.baseUrl}/auth/login');
      var response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'email': emailController.text,
          'password': passwordController.text,
          'device_name': 'security-supervisor-android',
        },
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        await AppLocal.saveDataLocal(
          key: 'token',
          value: responseBody['token'],
        );
        await AppLocal.saveDataLocal(
          key: 'email',
          value: emailController.text,
        );
        await AppLocal.saveDataLocal(
          key: 'password',
          value: passwordController.text,
        );
        Get.offAllNamed(NameRoutes.homeScreen);
      } else {
        isLoading.value = false;
        AppToastNotifiactions.toastNotificationError(
          context: Get.overlayContext!,
          title: "Attention",
          content: responseBody['message'],
        );
      }
    } catch (e) {
      isLoading.value = false;
      log("error catch login $e");
    }
  }

  RxBool isAbstractPassword = true.obs;
  void togglePassword() {
    isAbstractPassword.toggle();
  }

  Future<void> _secondFcmToken() async {
    try {
      String token = await AppLocal.readDataLocal(key: 'token');
      Uri url = Uri.parse('${AppString.baseUrl}/devices');
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'fcm_token': 'security-supervisor-android',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("send token success ${response.body}");
      } else {
        log("send token error ${response.body}");
      }
    } catch (e) {
      log("error catch send token $e");
    }
  }
}
