import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import '../create new password screen/createnewpassword_screen.dart';

class ForgotPasswordOtpScreenController extends GetxController {
  // Text controllers for OTP digits
  final List<TextEditingController> otpControllers = List.generate(
    4,
        (_) => TextEditingController(),
  );

  // Focus nodes for OTP fields
  final List<FocusNode> otpFocusNodes = List.generate(
    4,
        (_) => FocusNode(),
  );

  @override
  void onInit() {
    super.onInit();
    // Initialize any additional setup if needed
  }

  @override
  void onClose() {
    // Dispose controllers and focus nodes
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }

  // Reusable OTP input field widget
  Widget otpInputField(
      BuildContext context,
      TextEditingController controller,
      FocusNode currentFocus,
      FocusNode? nextFocus,
      ) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.16, // Reduced from 0.15 to fix overflow
      height: height * 0.065,
      decoration: BoxDecoration(
        color: Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: FTextStyle.custom(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColor.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.textFieldFill,
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            nextFocus.requestFocus();
          }
        },
      ),
    );
  }

  // Submit OTP
  void submitOtp(BuildContext context) {
    // Validate OTP
    for (var controller in otpControllers) {
      if (controller.text.trim().isEmpty) {
        Get.snackbar(
          "Error",
          "Please enter all OTP digits",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black54,
          colorText: Colors.white,
        );
        return;
      }
    }

    // Navigate to CreateNewPasswordScreen
    Get.to(() => const CreateNewPasswordScreen());
  }

  // Resend OTP (placeholder)
  void resendOtp() {
    // Clear existing OTP
    for (var controller in otpControllers) {
      controller.clear();
    }
    otpFocusNodes[0].requestFocus();
    // Show placeholder message
    Get.snackbar(
      "OTP Resent",
      "A new OTP has been sent (placeholder).",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black54,
      colorText: Colors.white,
    );
  }
}