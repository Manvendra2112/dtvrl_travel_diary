import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';
import 'forgotpasswordotp_screen_controller.dart';

class ForgotPasswordOtpScreen extends StatelessWidget {
  const ForgotPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return GetBuilder<ForgotPasswordOtpScreenController>(
      init: Get.put(ForgotPasswordOtpScreenController()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.08), // Top spacing
                  // App logo
                  Image.asset(
                    ImageAssets.appicon,
                    height: height * 0.15,
                    width: width * 0.3,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: height * 0.02),
                  // Title
                  Text(
                    "Enter The OTP",
                    style: FTextStyle.customPreahvihear(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  // Description
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                    maxLines: 1,
                    style: FTextStyle.customPreahvihear(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textfieldtextcolor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.06),
                  // OTP Input Fields and Resend OTP
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.otpInputField(context, controller.otpControllers[0], controller.otpFocusNodes[0], controller.otpFocusNodes[1]),
                            SizedBox(width: width * 0.015),
                            controller.otpInputField(context, controller.otpControllers[1], controller.otpFocusNodes[1], controller.otpFocusNodes[2]),
                            SizedBox(width: width * 0.015),
                            controller.otpInputField(context, controller.otpControllers[2], controller.otpFocusNodes[2], controller.otpFocusNodes[3]),
                            SizedBox(width: width * 0.015),
                            controller.otpInputField(context, controller.otpControllers[3], controller.otpFocusNodes[3], null),
                          ],
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: controller.resendOtp,
                          child: Text(
                            "Resend OTP",
                            style: FTextStyle.custom(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColor.resendotp,
                             // decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  // Submit Button
                  CustomWidget.elevatedCustomButton(
                    context,
                    "Submit",
                        () => controller.submitOtp(context),
                    width: width * 0.9,
                    bgColor: AppColor.primary,
                    textColor: AppColor.white,
                    borderColor: AppColor.primary,
                    borderRadius: 10,
                    fontSize: 16,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}