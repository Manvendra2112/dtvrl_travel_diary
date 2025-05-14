import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';
import 'onboard_screen_controller.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = CustomWidget.getHeight(context);
    double width = CustomWidget.getWidth(context);

    return GetBuilder<OnboardScreenController>(
      init: Get.put(OnboardScreenController()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Top container with image and rounded bottom corners
                Container(
                  height: height * 0.6, // 40% of screen height
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      ImageAssets.onboard,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04), // Gap after container
                // Welcome text
                Text(
                  "Welcome to DTVRL Travel Diary",
                  style: FTextStyle.customPreahvihear(
                    fontSize: 20, // Responsive font size
                    fontWeight: FontWeight.w400,
                    color: AppColor.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.02),
                // Description text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    style: FTextStyle.customPreahvihear(
                      fontSize: 12, // Responsive font size
                      fontWeight: FontWeight.w400,
                      color: AppColor.textfieldtextcolor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: height * 0.04),
                // Get Started button
                CustomWidget.elevatedCustomButton(
                  context,
                  "Get Started",
                      () => controller.navigateToSignUp(),
                  width: width * 0.9,
                  height: height*0.065,// 80% of screen width
                  bgColor: AppColor.primary, // 0xff3bc6c5
                  textColor: AppColor.white,
                  borderColor: AppColor.primary,
                  borderRadius: 10,
                  fontSize: 16, // Responsive font size
                  weight: FontWeight.w600,
                ),
                SizedBox(height: height * 0.02),
                // Already have an account button
                CustomWidget.elevatedCustomButton(
                  context,
                  "Already have an account",
                      () => controller.navigateToLogin(),
                  width: width * 0.9,
                  height: height*0.065,// 80% of screen width
                  bgColor: AppColor.white, // 0xff3bc6c5
                  textColor: AppColor.textfieldtextcolor,
                  borderColor: AppColor.primary,
                  borderRadius: 10,
                  fontSize: 16, // Responsive font size
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}