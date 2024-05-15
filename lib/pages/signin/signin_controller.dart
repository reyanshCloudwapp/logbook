import 'package:elogbook/service/api_service/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elogbook/routes/app_routes.dart';
import 'package:elogbook/utils/app_constants.dart';
import 'package:elogbook/utils/shared_pre.dart';

import '../../service/api_service/request_keys.dart';

class SigninController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = false.obs;

  void onSigninTap() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState?.validate() ?? false) {
      signInApi();

      /*
      if (userNameController.text.trim() == passwordController.text.trim()) {
        Get.offAllNamed(AppRoutes.home);
        SharedPre.setValue(
          SharedPre.isLogin,
          true,
        );
        SharedPre.setValue(
          SharedPre.username,
          userNameController.text.trim(),
        );
        Get.snackbar(
          AppConstants.success,
          '${AppConstants.signinSuccessText1}${userNameController.text.trim()}${AppConstants.signinSuccessText2}',
        );
      } else {
        Get.snackbar(
          AppConstants.failure,
          AppConstants.signinFailText,
          snackPosition: SnackPosition.BOTTOM,
        );
      }

       */
    }
  }

  void signInApi() async {
    var body = {
      RequestKeys.email: userNameController.text.trim(),
      RequestKeys.password: passwordController.text.trim()
    };
    var resp = await Api().loginApi(body);
    if (resp.statusCode == 200) {
      Get.offAllNamed(AppRoutes.home);
      SharedPre.setValue(
        SharedPre.isLogin,
        true,
      );
      SharedPre.setValue(
        SharedPre.username,
        userNameController.text.trim(),
      );
      Get.snackbar(
        AppConstants.success,
        '${AppConstants.signinSuccessText1}${userNameController.text.trim()}${AppConstants.signinSuccessText2}',
      );
    }
  }

  void onSignupTap() {
    Get.toNamed(AppRoutes.signup);
  }

  void onEyeTap() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
