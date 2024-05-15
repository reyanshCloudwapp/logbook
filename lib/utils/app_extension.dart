import 'package:elogbook/utils/app_constants.dart';
import 'package:flutter/material.dart';

extension TextStyles on TextStyle {
  TextStyle get medium => const TextStyle(
        fontSize: 16,
        fontFamily: 'Medium',
      );

  TextStyle get bold => const TextStyle(
        fontSize: 16,
        fontFamily: 'Bold',
        fontWeight: FontWeight.w800,
      );

  TextStyle get light => const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 16,
        fontFamily: 'Regular',
      );

  TextStyle get italic => const TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 16,
        fontFamily: 'Regular',
      );

  TextStyle get semiBold => const TextStyle(
        fontSize: 16,
        fontFamily: 'SemiBold',
      );
}

extension DateTimes on DateTime {
  String get greetText {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return AppConstants.goodMorning;
    } else if (hour < 17) {
      return AppConstants.goodAfternoon;
    } else {
      return AppConstants.goodEvening;
    }
  }
}

extension InputDec on InputDecoration {
  InputDecoration txtFieldStyle(
          {required String hintText, required String labelName}) =>
      InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(minHeight: 20),
        filled: true,
        counter: const Offstage(),
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
        labelText: labelName,
        labelStyle: const TextStyle().medium.copyWith(fontSize: 16),
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.green),
        ),
      );

  InputDecoration passwordTxtFieldStyle({
    required String hintText,
    required String labelName,
    required bool isPasswordVisible,
    required VoidCallback onEyeTap,
  }) =>
      InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(minHeight: 20),
        filled: true,
        counter: const Offstage(),
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
        labelText: labelName,
        labelStyle: const TextStyle().medium.copyWith(fontSize: 16),
        suffix: IconButton(
          constraints: const BoxConstraints(minHeight: 16),
          splashRadius: 20,
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
          ),
          padding: EdgeInsets.zero,
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            size: 20,
          ),
          onPressed: onEyeTap,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.green),
        ),
      );

  InputDecoration dateTxtFieldStyle({
    required String hintText,
    required String labelName,
    required VoidCallback onEyeTap,
  }) =>
      InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(minHeight: 20),
        filled: true,
        counter: const Offstage(),
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
        labelText: labelName,
        labelStyle: const TextStyle().medium.copyWith(fontSize: 16),
        suffix: IconButton(
          constraints: const BoxConstraints(minHeight: 16),
          splashRadius: 20,
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
          ),
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.calendar_month,
            size: 20,
          ),
          onPressed: onEyeTap,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.green),
        ),
      );
}
