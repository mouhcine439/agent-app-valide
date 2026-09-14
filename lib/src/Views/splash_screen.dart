import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/routes/name_routes.dart';
import 'package:agentapp/src/widgets/body_widget.dart';
import 'package:agentapp/src/widgets/custom_loading.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTime();
    super.initState();
  }

  Future<void> startTime() async {
    await Future.delayed(Duration(seconds: 5), () {
      Get.offAllNamed(NameRoutes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      scafoldBody: Scaffold(
        body: Center(
          child: SpinKitFadingCircle(
            color: AppColors.primaryColor,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
