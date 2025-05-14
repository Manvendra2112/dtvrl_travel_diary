import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';
import 'splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = CustomWidget.getHeight(context);
    double width = CustomWidget.getWidth(context);

    return GetBuilder<SplashScreenController>(
      init: Get.put(SplashScreenController()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SafeArea(
            child: Center(
              child: Image.asset(
                ImageAssets.splash, // Using splash image from ImageAssets
                height: height * 0.3, // Responsive height (30% of screen height)
                width: width * 0.35, // Responsive width (50% of screen width)
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}