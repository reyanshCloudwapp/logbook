import 'package:get/get.dart';
import 'package:elogbook/pages/signup/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}
