import 'dart:ui';
import 'package:agentapp/src/constants/app_colors.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Color showColorStatus({required String status}) {
    switch (status) {
      case "Terminéé":
        return AppColors.valideColor;
      case "En cours":
        return AppColors.orangeColor;
      case "Annulée":
        return AppColors.errorColor;
      default:
        return AppColors.greyColor;
    }
  }
}
