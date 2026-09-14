import 'package:agentapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.bgColorButton,
    required this.title,
    required this.colorText,
  });
  final void Function()? onPressed;
  final Color bgColorButton;
  final String title;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
          )),
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStateProperty.all(bgColorButton),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          )),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: CustomText(
            title: title,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colorText,
          ),
        ),
      ),
    );
  }
}
