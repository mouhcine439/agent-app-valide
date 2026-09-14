import 'dart:convert';
import 'dart:developer';

import 'package:agentapp/src/constants/app_strings.dart';
import 'package:agentapp/src/helper/app_alerts.dart';
import 'package:agentapp/src/helper/app_local.dart';
import 'package:agentapp/src/helper/app_toast_notifications.dart';
import 'package:agentapp/src/models/profile_model.dart';
import 'package:agentapp/src/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  late TextEditingController currentPasswordController, newPasswordController;
  @override
  void onInit() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    fetchProfile();
    super.onInit();
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }

  RxBool isLoading = false.obs;
  ProfileModel? profileModel;
  Future<void> fetchProfile() async {
    try {
      isLoading.value = true;
      Uri url = Uri.parse("${AppString.baseUrl}/auth/me/supervisor");
      String token = await AppLocal.readDataLocal(key: 'token');
      var response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        profileModel = ProfileModel.fromMap(responseBody);
      }
    } catch (e) {
      log("error catch $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logOut() async {
    try {
      AppAlerts.customAlertLoading(context: Get.overlayContext!);
      Uri url = Uri.parse("${AppString.baseUrl}/auth/logout");
      String token = await AppLocal.readDataLocal(key: 'token');
      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.back();
        log("logout success ${response.body}");
        AppToastNotifiactions.toastNotificationSuccess(
          context: Get.overlayContext!,
          title: "Success",
          content: responseBody['message'],
        );
        await AppLocal.deleteDataLocal(key: 'token');
        Get.offAllNamed(NameRoutes.loginScreen);
      } else if (response.statusCode == 401) {
        log("token is invalide login again");
      } else {
        Get.back();
        AppToastNotifiactions.toastNotificationError(
          context: Get.overlayContext!,
          title: "Erreur",
          content: responseBody['message'],
        );
        log("logout failed ${response.body}");
      }
    } catch (e) {
      Get.back();
      log("error catch $e");
    }
  }

  Future<void> changePassword() async {
    if (currentPasswordController.text.isEmpty) {
      AppToastNotifiactions.toastNotificationWarning(
        context: Get.overlayContext!,
        title: "Attention",
        content: "Veuillez saisir votre mot de passe actuel",
      );
      return;
    }
    if (newPasswordController.text.isEmpty) {
      AppToastNotifiactions.toastNotificationWarning(
        context: Get.overlayContext!,
        title: "Attention",
        content: "Veuillez saisir votre nouveau mot de passe",
      );
      return;
    }
    try {
      AppAlerts.customAlertLoading(context: Get.overlayContext!);
      String token = await AppLocal.readDataLocal(key: 'token');
      Uri url = Uri.parse("${AppString.baseUrl}/auth/change-password");
      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {
          "current_password": currentPasswordController.text,
          "password": newPasswordController.text,
        },
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();
        AppToastNotifiactions.toastNotificationSuccess(
          context: Get.overlayContext!,
          title: "Success",
          content: responseBody['message'],
        );
      } else {
        Get.back();
        AppToastNotifiactions.toastNotificationError(
          context: Get.overlayContext!,
          title: "Error",
          content: responseBody['message'],
        );
      }
    } catch (e) {
      Get.back();
      log("error catch change password $e");
    }
  }
}
