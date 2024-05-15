import 'package:elogbook/routes/app_routes.dart';
import 'package:elogbook/utils/app_constants.dart';
import 'package:elogbook/utils/shared_pre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiHelper {
  static const _smallSize = 16.0;
  static const _mediumSize = 28.0;
  static const _largeSize = 40.0;

  static Widget horizontalSpace(double value) => SizedBox(
        width: value,
      );

  static Widget smallHorizontalSpace() => const SizedBox(
        width: _smallSize,
      );

  static Widget mediumHorizontalSpace() => const SizedBox(
        width: _mediumSize,
      );

  static Widget largeHorizontalSpace() => const SizedBox(
        width: _largeSize,
      );

  static Widget verticalSpace(double value) => SizedBox(
        height: value,
      );

  static Widget smallVerticalSpace() => const SizedBox(
        height: _smallSize,
      );

  static Widget mediumVerticalSpace() => const SizedBox(
        width: _mediumSize,
      );

  static Widget largeVerticalSpace() => const SizedBox(
        width: _largeSize,
      );

  static void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert!!"),
          content: const Text(AppConstants.signOutAlertMsg),
          actions: [
            MaterialButton(
              child: const Text(AppConstants.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              child: const Text(AppConstants.confirm),
              onPressed: () {
                Navigator.of(context).pop();
                SharedPre.clearAll();
                Get.offAllNamed(AppRoutes.signin);
              },
            ),
          ],
        );
      },
    );
  }

  static String get greetText {
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
