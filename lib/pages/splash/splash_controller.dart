import 'dart:async';

import 'package:elogbook/routes/app_routes.dart';
import 'package:elogbook/utils/shared_pre.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _runTimer();
    super.onInit();
  }

  void _runTimer() async {
    Timer(
      const Duration(seconds: 2),
      () async {
        final bool? isLogin = await SharedPre.getBoolValue(SharedPre.isLogin);
        if (isLogin ?? false) {
          Get.offAllNamed(AppRoutes.home);
        } else {
          Get.offAllNamed(AppRoutes.signin);
        }
      },
    );
  }
}
