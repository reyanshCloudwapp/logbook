import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elogbook/pages/signup/signup_controller.dart';
import 'package:elogbook/utils/app_constants.dart';
import 'package:elogbook/utils/app_extension.dart';
import 'package:elogbook/utils/app_button.dart';
import 'package:elogbook/utils/ui_helper.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppConstants.signUp,
            style: const TextStyle().medium,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
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
                    TextFormField(
                      controller: controller.emailController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return AppConstants.pleaseEnterEmail;
                        } else if (!(value?.isEmail ?? true)) {
                          return AppConstants.pleaseEnterValidEmail;
                        }
                        return null;
                      },
                      decoration: const InputDecoration().txtFieldStyle(
                        hintText: AppConstants.email,
                        labelName: AppConstants.email,
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
                    UiHelper.smallVerticalSpace(),
                    Obx(() {
                      return TextFormField(
                        controller: controller.confirmPasswordController,
                        obscureText: !controller.isConfirmPasswordVisible.value,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return AppConstants.pleaseEnterConfirmPassword;
                          } else if (value !=
                              controller.passwordController.text) {
                            return AppConstants
                                .confirmPasswordNotMatchWithPassword;
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration().passwordTxtFieldStyle(
                          hintText: AppConstants.confirmPassword,
                          labelName: AppConstants.confirmPassword,
                          isPasswordVisible:
                              controller.isConfirmPasswordVisible.value,
                          onEyeTap: () =>
                              controller.onEyeTap(isConfirmTextField: true),
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
                  onPressed: () => controller.onSignupTap(),
                  name: AppConstants.signUp,
                  btnRadius: 20,
                ),
              ),
              UiHelper.smallVerticalSpace(),
            ],
          ),
        ),
      ),
    );

  }
}
