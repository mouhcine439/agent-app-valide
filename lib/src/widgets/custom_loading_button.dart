import 'package:agentapp/src/widgets/custom_loading.dart';
import 'package:flutter/material.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    super.key,
    required this.bgColorButton,
  });
  final Color bgColorButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: null,
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
        child: Center(
          child: CustomLoading(),
        ),
      ),
    );
  }
}
