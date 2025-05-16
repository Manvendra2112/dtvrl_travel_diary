import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_screen/login_screen.dart';

class CreateNewPasswordController extends GetxController {
  // Text controller
  final TextEditingController passwordTextCon = TextEditingController();

  // Focus node
  final FocusNode passwordFocus = FocusNode();

  @override
  void onInit() {
    super.onInit();
    // Initialize any additional setup if needed
  }

  @override
  void onClose() {
    // Dispose controller and focus node
    passwordTextCon.dispose();
    passwordFocus.dispose();
    super.onClose();
  }

  // Submit new password
  void submitNewPassword(BuildContext context) {
    // Basic validation
    if (passwordTextCon.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter a password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54,
        colorText: Colors.white,
      );
      return;
    }
    if (passwordTextCon.text.trim().length < 8) {
      Get.snackbar(
        "Error",
        "Password must be at least 8 characters long",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54,
        colorText: Colors.white,
      );
      return;
    }

    // Navigate to LoginScreen and clear navigation stack
    Get.off(() => const LoginScreen());
  }
}