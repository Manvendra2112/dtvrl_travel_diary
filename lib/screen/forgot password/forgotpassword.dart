import 'package:dtvrl_travel_diary/screen/forgot%20password/forgotpassword_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return GetBuilder<ForgotPasswordController>(
      init: Get.put(ForgotPasswordController()  ),
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
                    "Send Otp",
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
                  SizedBox(height: height * 0.03),
                  // Username

                  // Email Address or Phone Number
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Address / Phone Number*",
                      style: FTextStyle.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomWidget.textInputFiled(
                    controller.emailTextCon,
                    focusNode: controller.emailFocus,
                    textAlign: TextAlign.left,
                    topPadding: 0,
                    leftPadding: 0,
                    rightPadding: 0,
                    bottomPadding: 10,
                    // enableBorder: true,
                    // borderColor: AppColor.border,
                    // borderWidth: 1,
                    blurRadius: 10,
                    borderRadius: 50,
                    fillColorFiled: true,
                    fillColors: AppColor.textFieldFill,
                    textInputType: TextInputType.emailAddress,
                    hintText: "mani123@gmail.com",
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  // Password

                  // Forgot Password
                  SizedBox(height: height * 0.02),
                  // Login Button
                  CustomWidget.elevatedCustomButton(
                    context,
                    "Submit",
                        () => controller.submitForgotPassword(context),                    width: width * 0.9,
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