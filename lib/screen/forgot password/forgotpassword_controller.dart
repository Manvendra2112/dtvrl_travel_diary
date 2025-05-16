import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../forgot password otp screen/forgotpasswordotp_screen.dart';

class ForgotPasswordController extends GetxController {
  // Text controller
  final TextEditingController emailTextCon = TextEditingController();

  // Focus node
  final FocusNode emailFocus = FocusNode();

  @override
  void onInit() {
    super.onInit();
    // Initialize any additional setup if needed
  }

  @override
  void onClose() {
    // Dispose controller and focus node
    emailTextCon.dispose();
    emailFocus.dispose();
    super.onClose();
  }

  // Submit forgot password
  void submitForgotPassword(BuildContext context) {
    // Basic validation
    if (emailTextCon.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter an email or phone number",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54,
        colorText: Colors.white,
      );
      return;
    }

    // Navigate to ForgotPasswordOtpScreen
    Get.to(() => const ForgotPasswordOtpScreen());
  }
}