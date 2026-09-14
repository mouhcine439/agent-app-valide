import 'package:agentapp/src/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: AppColors.whiteColor,
      size: 30.0,
    );
  }
}
