import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.scafoldBody,
  });
  final Widget scafoldBody;
  @override
  Widget build(BuildContext context) {
    final textSize = MediaQuery.of(context);
    return MediaQuery(
      data: textSize.copyWith(
        textScaler: textSize.textScaler.clamp(
          maxScaleFactor: 1.0,
          minScaleFactor: 1.0,
        ),
      ),
      child: scafoldBody,
    );
  }
}
