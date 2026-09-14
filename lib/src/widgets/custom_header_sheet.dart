import 'package:agentapp/src/constants/app_colors.dart';
import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomHeaderSheet extends StatelessWidget {
  const CustomHeaderSheet({
    super.key,
    this.onTap,
    required this.title,
  });
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          title: title,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(6.0),
            alignment: Alignment.center,
            // radius: 15.0,
            decoration: BoxDecoration(
              color: AppColors.greyColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Icon(
              Icons.close,
              color: AppColors.blackColor,
            ),
          ),
        )
      ],
    );
  }
}
