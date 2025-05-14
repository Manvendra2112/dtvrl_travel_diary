import 'package:dtvrl_travel_diary/screen/forgot%20password/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bottomnavbar/bottomnavbar_screen.dart';
import '../home_screen/home_screen.dart';
import '../signup_screen/signup_screen.dart';


class LoginScreenController extends GetxController {
  // Text controllers
  final TextEditingController usernameTextCon = TextEditingController();
  final TextEditingController emailTextCon = TextEditingController();
  final TextEditingController passwordTextCon = TextEditingController();

  // Focus nodes
  final FocusNode usernameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  void onInit() {
    super.onInit();
    // Initialize any additional setup if needed
  }

  @override
  void onClose() {
    // Dispose controllers and focus nodes
    usernameTextCon.dispose();
    emailTextCon.dispose();
    passwordTextCon.dispose();
    usernameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }

  // Navigate to SignUpScreen
  void navigateToSignUp() {
    Get.to(() => const SignUpScreen());
  }

  // Navigate to ForgotPasswordScreen
  void navigateToForgotPassword() {
    Get.to(() => const ForgotPasswordScreen());
  }

  // Submit login
  void submitLogin(BuildContext context) {
    // Basic validation
    if (usernameTextCon.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter a username",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54,
        colorText: Colors.white,
      );
      return;
    }
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

    // Navigate to HomeScreen (replace with actual authentication logic)
    Get.off(() => const BottomNavScreen());  }

  // Google Sign-In (placeholder)
  void signInWithGoogle() {
    // Placeholder: Show snackbar as in SignUpScreen
    Get.snackbar(
      "Google Sign-In",
      "Google Sign-In is not implemented yet.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black54,
      colorText: Colors.white,
    );
  }
}