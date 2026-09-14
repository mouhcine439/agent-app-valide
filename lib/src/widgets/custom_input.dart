import 'package:agentapp/src/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.myController,
    required this.maxLines,
    required this.hint,
    required this.keyboardType,
    this.obscureText = false,
    this.isPassword = false,
    this.onPressed,
    this.onChanged,
    required this.textInputAction,
    required this.icon,
  });

  final TextEditingController myController;
  final int? maxLines;
  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isPassword;
  final void Function()? onPressed;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textInputAction: textInputAction,
      obscureText: obscureText,
      style: const TextStyle(
        color: AppColors.blackColor,
        fontSize: 16.0,
      ),
      controller: myController,
      cursorColor: AppColors.secondColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.022,
          horizontal: MediaQuery.of(context).size.width * 0.03,
        ),
        filled: true,
        fillColor: AppColors.whiteColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColors.greyColor.withValues(alpha: 0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColors.secondColor,
            width: 1.5,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 13.5,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(
          icon,
          color: AppColors.greyColor,
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.secondColor,
                ),
              )
            : null,
      ),
      keyboardType: keyboardType,
    );
  }
}
