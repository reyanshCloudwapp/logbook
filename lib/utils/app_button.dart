import 'package:elogbook/utils/app_extension.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final Color? btnColor;
  final double? textSize;
  final double? btnRadius;
  final EdgeInsets? padding;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.name,
    this.btnColor,
    this.textSize,
    this.padding,
    this.btnRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            btnRadius ?? 8,
          ),
        ),
        padding: padding,
      ),
      child: Text(
        name,
        style: const TextStyle()
            .medium
            .copyWith(fontSize: textSize, color: Colors.white),
      ),
    );
  }
}
