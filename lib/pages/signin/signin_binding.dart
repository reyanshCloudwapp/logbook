import 'package:get/get.dart';
import 'package:elogbook/pages/signin/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SigninController());
  }
}
