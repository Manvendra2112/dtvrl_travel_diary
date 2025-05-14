import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';

class UpdateProfileSuccessScreen extends StatelessWidget {
  const UpdateProfileSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          SizedBox(height: height * 0.06),
          // Cross icon at top right
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 25),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  ImageAssets.crossIcon, // Replace with actual cross icon asset
                  height: 30,
                  width: 30,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.close,
                    size: 30,
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          // Tick image in center
          Image.asset(
            ImageAssets.tickIcon, // Replace with actual tick icon asset
            height: 120,
            width: 120,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.check_circle,
              size: 100,
              color: AppColor.primary,
            ),
          ),
          SizedBox(height: height * 0.02),
          // Success text
          Text(
            "Profile Has Been Updated",
            style: FTextStyle.customPreahvihear(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
          ),
          SizedBox(height: height * 0.01),
          // Description text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
              textAlign: TextAlign.center,
              style: FTextStyle.custom(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.textfieldtextcolor,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}