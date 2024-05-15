import 'package:get/get.dart';
import 'package:elogbook/pages/home/home_binding.dart';
import 'package:elogbook/pages/home/home_page.dart';
import 'package:elogbook/pages/signin/signin_binding.dart';
import 'package:elogbook/pages/signin/signin_page.dart';
import 'package:elogbook/pages/signup/signup_binding.dart';
import 'package:elogbook/pages/signup/signup_page.dart';
import 'package:elogbook/pages/splash/splash_page.dart';
import 'package:elogbook/routes/app_routes.dart';

class AppPages {
  static var pageList = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => const SigninPage(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
