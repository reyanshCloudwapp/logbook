import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elogbook/pages/signin/signin_controller.dart';
import 'package:elogbook/utils/app_constants.dart';
import 'package:elogbook/utils/app_extension.dart';
import 'package:elogbook/utils/app_button.dart';
import 'package:elogbook/utils/ui_helper.dart';

class SigninPage extends GetView<SigninController> {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              UiHelper.verticalSpace(Get.height * .25),
              Text(
                AppConstants.welcomeText,
                style: const TextStyle().medium,
                textAlign: TextAlign.center,
              ),
              Text(
                AppConstants.smileEmoji,
                style: const TextStyle().medium.copyWith(fontSize: 32),
                textAlign: TextAlign.center,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    UiHelper.smallVerticalSpace(),
                    TextFormField(
                      controller: controller.userNameController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return AppConstants.pleaseEnterUsername;
                        }
                        return null;
                      },
                      decoration: const InputDecoration().txtFieldStyle(
                        hintText: AppConstants.username,
                        labelName: AppConstants.username,
                      ),
                    ),
                    UiHelper.smallVerticalSpace(),
                    Obx(() {
                      return TextFormField(
                        controller: controller.passwordController,
                        obscureText: !controller.isPasswordVisible.value,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return AppConstants.pleaseEnterPassword;
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration().passwordTxtFieldStyle(
                          hintText: AppConstants.password,
                          labelName: AppConstants.password,
                          isPasswordVisible: controller.isPasswordVisible.value,
                          onEyeTap: () => controller.onEyeTap(),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              UiHelper.smallVerticalSpace(),
              SizedBox(
                width: Get.width * .9,
                child: AppButton(
                  onPressed: () => controller.onSigninTap(),
                  name: AppConstants.signIn,
                  btnRadius: 20,
                ),
              ),
              UiHelper.smallVerticalSpace(),
              Text.rich(
                TextSpan(
                  text: AppConstants.newToHere,
                  style: const TextStyle().medium,
                  children: <InlineSpan>[
                    TextSpan(
                      text: AppConstants.signUp,
                      style: const TextStyle().bold,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => controller.onSignupTap(),
                    ),
                  ],
                ),
              ),
              UiHelper.smallVerticalSpace(),
              Text.rich(
                TextSpan(
                  text: AppConstants.newToHere,
                  style: const TextStyle().medium,
                  children: <InlineSpan>[
                    TextSpan(
                      text: AppConstants.signUp,
                      style: const TextStyle().bold,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => controller.onSignupTap(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
