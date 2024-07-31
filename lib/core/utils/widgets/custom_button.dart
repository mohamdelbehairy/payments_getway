import 'package:flutter/material.dart';
import 'package:payments_getway/core/utils/widgets/custom_circle_indicator.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      this.buttonHeight,
      this.isLoading = false});
  final String buttonName;
  final Function() onPressed;
  final double? buttonHeight;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: buttonHeight ?? 65,
        minWidth: double.infinity,
        color: Colors.green,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        onPressed: onPressed,
        child: isLoading
            ? const CustomCircleIndicator(color: Colors.white)
            : Text(buttonName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal)));
  }
}
