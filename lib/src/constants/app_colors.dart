import 'package:flutter/material.dart';

class AppColors {
  static const Color blackColor = Color(0xff000000);
  static const Color primaryColor = Color(0xFF1f386b);
  static const secondColor = Color(0xFF4f8aff);
  static const warningColor = Color(0xFFAE445A);
  static const Color greyColor = Color(0xffB4B4B3);
  static Color greyColorFoncait = Colors.grey[600]!;
  static const Color errorColor = Color(0xffff0000);
  static const Color valideColor = Color(0xff3CCF4E);
  static const orangeColor = Color(0xffF37F0C);
  static const redFoncait = Color(0xFFAF1740);
  static const blueColor = Color(0xFF37AFE1);

  static LinearGradient gradientColorApp = const LinearGradient(
    colors: [
      primaryColor,
      secondColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // dark mode
  static const Color bgColorDark = Color(0xff121212);
  static const Color secondColorDark = Color(0xff1e1e1e);
  // light mode
  static const Color whiteColor = Color(0xffffffff);
  static const Color bgColor = Color(0xffffffff);
}
