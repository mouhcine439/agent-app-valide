import 'dart:developer';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InitialController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _listenToConnection();
  }

  RxBool isUserHasInternet = false.obs;
  void _listenToConnection() {
    try {
      Connectivity()
          .onConnectivityChanged
          .listen((List<ConnectivityResult> results) {
        if (results.contains(ConnectivityResult.wifi)) {
          isUserHasInternet.value = true;
          log("=============> ✅ Connected via Wi-Fi  <=============");
        } else if (results.contains(ConnectivityResult.mobile)) {
          isUserHasInternet.value = true;
          log("=============> ✅ Connected via Mobile (4G / 3G / 2G) <=============");
        } else {
          isUserHasInternet.value = false;
          log("=============> ❌ No Internet Connection <=============");
        }
      });
    } catch (e) {
      log("error catch check internet connection $e");
    }
  }
}
