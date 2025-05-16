import 'package:get/get.dart';

import '../onboard_screen/onboard_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Delay for splash screen display (3 seconds)
    Future.delayed(const Duration(seconds: 3), () {
      // TODO: Navigate to onboard screen when implemented
      Get.to(() => OnboardScreen());
    });
  }
}