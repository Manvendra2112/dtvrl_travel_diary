import 'package:dtvrl_travel_diary/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/alert_dialog_manager.dart';
import '../bottomnavbar/bottomnavbar_screen.dart';

class SignUpScreenController extends GetxController {
  TextEditingController usernameTextCon = TextEditingController();
  TextEditingController emailTextCon = TextEditingController();
  TextEditingController phoneTextCon = TextEditingController();
  TextEditingController passwordTextCon = TextEditingController();
  TextEditingController confirmPasswordTextCon = TextEditingController();
  TextEditingController referralUsernameTextCon = TextEditingController(); // New controller

  FocusNode usernameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();
  FocusNode referralUsernameFocus = FocusNode(); // New focus node

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isTermsAgreed = false;

  String selectedCountryCode = '+91'; // Default to India

  // Simulated list of existing usernames for uniqueness check
  final List<String> existingUsernames = ["john@123", "mani@123"];

  @override
  void onInit() {
    super.onInit();
    phoneTextCon.text = ""; // Initialize empty, country code is handled by CountryCodePicker
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    update();
  }

  void toggleTermsAgreed() {
    isTermsAgreed = !isTermsAgreed;
    update();
  }

  void updateCountryCode(String code) {
    selectedCountryCode = code;
    update();
  }

  bool validateForm(BuildContext context) {
    // Username validation
    if (usernameTextCon.text.isEmpty) {
      usernameFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Warning", "Username can't be empty", false, context);
      return false;
    } else if (!RegExp(r'^[a-zA-Z0-9@]+$').hasMatch(usernameTextCon.text)) {
      usernameFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Warning", "Username can only contain letters, numbers, and @", false, context);
      return false;
    } else if (existingUsernames.contains(usernameTextCon.text)) {
      usernameFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Warning", "Username is already taken", false, context);
      return false;
    }

    // Email validation
    if (emailTextCon.text.isEmpty) {
      emailFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Warning", "Email address can't be empty", false, context);
      return false;
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailTextCon.text)) {
      emailFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Warning", "Please enter a valid email address", false, context);
      return false;
    }

    // Phone number validation
    String phoneNumber = phoneTextCon.text.trim();
    if (phoneNumber.isEmpty) {
      phoneFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Warning", "Phone number can't be empty", false, context);
      return false;
    } else if (!RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      phoneFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Warning", "Phone number must be a valid 10-digit number", false, context);
      return false;
    }

    // Password validation
    if (passwordTextCon.text.isEmpty) {
      passwordFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Warning", "Password can't be empty", false, context);
      return false;
    } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$')
        .hasMatch(passwordTextCon.text)) {
      passwordFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Warning", "Password must be at least 8 characters with letters, numbers, and special characters", false, context);
      return false;
    }

    // Confirm password validation
    if (confirmPasswordTextCon.text.isEmpty) {
      confirmPasswordFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Warning", "Confirm password can't be empty", false, context);
      return false;
    } else if (confirmPasswordTextCon.text != passwordTextCon.text) {
      confirmPasswordFocus.requestFocus();
      AlertDialogManager.getSnackBarMsg(
          "Warning", "Passwords do not match", false, context);
      return false;
    }

    // Terms and conditions validation
    if (!isTermsAgreed) {
      AlertDialogManager.getSnackBarMsg(
          "Warning", "You must agree to the Terms & Conditions", false, context);
      return false;
    }

    return true;
  }

  void submitSignUp(BuildContext context) {
    if (!validateForm(context)) {
      return;
    }

    // Combine country code and phone number for submission
    String fullPhoneNumber = "$selectedCountryCode ${phoneTextCon.text.trim()}";
    print("Submitting phone number: $fullPhoneNumber");

    AlertDialogManager.getSnackBarMsg(
        "Success", "Account created successfully", true, context);
    Get.off(() => const BottomNavScreen());
  }

  void signUpWithGoogle() {
    AlertDialogManager.getSnackBarMsg(
        "Info", "Google Sign Up not implemented yet", false, Get.context!);
  }

  @override
  void onClose() {
    usernameTextCon.dispose();
    emailTextCon.dispose();
    phoneTextCon.dispose();
    passwordTextCon.dispose();
    confirmPasswordTextCon.dispose();
    referralUsernameTextCon.dispose(); // Dispose new controller
    usernameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    referralUsernameFocus.dispose(); // Dispose new focus node
    super.onClose();
  }
}