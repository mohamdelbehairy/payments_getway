import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      this.buttonHeight});
  final String buttonName;
  final Function() onPressed;
  final double? buttonHeight;

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
        child: Text(buttonName,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal)));
  }
}
