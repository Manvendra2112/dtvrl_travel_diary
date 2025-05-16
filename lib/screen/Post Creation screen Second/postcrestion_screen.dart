import 'package:dtvrl_travel_diary/screen/Post%20Creation%20screen%20Second/postcreation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';

class PostCreationScreenSecond extends StatelessWidget {
  const PostCreationScreenSecond({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return GetBuilder<PostCreationScreenSecondController>(
      init: Get.put(PostCreationScreenSecondController()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: height * 0.06),
                  // Header with back icon and title
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: AppColor.black),
                        onPressed: () => Get.back(),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "New Post",
                        style: FTextStyle.custom(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  // Square image
                  Container(
                    width: width * 0.85,
                    height: width * 0.95, // Square size
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageAssets.postImage1), // Replace with actual image
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Image.asset(
                      ImageAssets.postImage1,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey,
                        child: Icon(Icons.image, size: 50, color: AppColor.white),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  // Caption text field
                  CustomWidget.textInputFiled(
                    controller.captionTextCon,
                    focusNode: controller.captionFocus,
                    textAlign: TextAlign.left,
                    topPadding: 0,
                    height: height*0.2,
                    minLine: 4,
                    leftPadding: 0,
                    rightPadding: 0,
                    bottomPadding: 10,
                    blurRadius: 10,
                    borderRadius: 10,
                    fillColorFiled: true,
                    fillColors: AppColor.lightCyanWithOpacity,
                    textInputType: TextInputType.multiline,
                    hintText: "Add Caption.....",
                    maxLine: 4,
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.08),
                  // Share Post button
                  CustomWidget.elevatedCustomButton(
                    context,
                    "Share Post",
                    controller.sharePost,
                    width: width,
                    bgColor: AppColor.primary,
                    textColor: AppColor.white,
                    borderColor: AppColor.primary,
                    borderRadius: 10,
                    fontSize: 16,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: height * 0.03),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}