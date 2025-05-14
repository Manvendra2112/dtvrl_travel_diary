import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/screen/signup_screen/signup_screen.dart';

import '../login_screen/login_screen.dart';

class OnboardScreenController extends GetxController {
  void navigateToSignUp() {
    Get.to(() => const SignUpScreen());
  }

  void navigateToLogin() {
    // TODO: Navigate to login screen when implemented
     Get.to(() => LoginScreen());
  }
}