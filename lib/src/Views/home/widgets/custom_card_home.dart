import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  const CustomCardHome({
    super.key,
    required this.title,
    required this.secondTitle,
    required this.color,
  });
  final String title, secondTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            title: title,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: AppColors.whiteColor,
          ),
          CustomText(
            title: secondTitle,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}
