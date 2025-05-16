import 'package:dtvrl_travel_diary/screen/rate%20screen/ratereview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';

class RateReviewScreen extends StatelessWidget {
  const RateReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    double constrainedWidth = MediaQuery.of(context).size.width;
    double constrainedHeight = MediaQuery.of(context).size.height;

    return GetBuilder<RateReviewScreenController>(
      init: RateReviewScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: constrainedHeight * 0.08),
                  // Header Section
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColor.black,
                          size: (constrainedWidth * 0.07).clamp(24, 30),
                        ),
                      ),
                      SizedBox(width: constrainedWidth * 0.03),
                      Text(
                        "Rate Now",
                        style: FTextStyle.custom(
                          fontSize: (constrainedWidth * 0.06).clamp(22, 24),
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: constrainedHeight * 0.03),
                  // Rate the Location Section
                  Text(
                    "Rate the Location",
                    style: FTextStyle.custom(
                      fontSize: (constrainedWidth * 0.025).clamp(18, 20),
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: constrainedHeight * 0.02),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: (constrainedWidth * 0.07).clamp(24, 30),
                        backgroundImage: AssetImage(ImageAssets.avatar),
                      ),
                      SizedBox(width: constrainedWidth * 0.03),
                      Row(
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              controller.setLocationRating(index + 1);
                            },
                            child: Icon(
                              Icons.star,
                              color: index < controller.locationRating
                                  ? Color(0xFFFFCC00)
                                  : Colors.grey,
                              size: (constrainedWidth * 0.075).clamp(24, 30),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: constrainedHeight * 0.03),
                  // Review Text Field
                  TextField(
                    controller: controller.reviewController,
                    maxLines: 7,

                    decoration: InputDecoration(
                      hintText: "Write your review here...",
                      hintStyle: FTextStyle.custom(
                        fontSize: (constrainedWidth * 0.03).clamp(14, 16),
                        fontWeight: FontWeight.w500,
                        color: AppColor.textfieldtextcolor,
                      ),
                      filled: true,

                      fillColor: AppColor.textFieldFill,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xFF838383),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xFF838383),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xFF838383),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: constrainedHeight * 0.03),
                  // Ratings Section
                  Row(
                    children: [
                      Text(
                        "Ratings",
                        style: FTextStyle.custom(
                          fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(width: constrainedWidth * 0.02),
                      Row(
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              controller.setOverallRating(index + 1);
                            },
                            child: Icon(
                              Icons.star,
                              color: index < controller.overallRating
                                  ? Color(0xFFFFCC00)
                                  : Colors.grey,
                              size: (constrainedWidth * 0.06).clamp(24, 30),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: constrainedHeight * 0.03),
                  // Recommended Section
                  Row(
                    children: [
                      Text(
                        "Recommended",
                        style: FTextStyle.custom(
                          fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(width: constrainedWidth * 0.025),
                      Icon(
                        Icons.done_all,
                        color: AppColor.primary,
                        size: (constrainedWidth * 0.05).clamp(16, 18),
                      ),
                    ],
                  ),
                  SizedBox(height: constrainedHeight * 0.03),
                  // Submit Button
                  CustomWidget.elevatedCustomButton(
                    context,
                    "Submit",
                        () {
                      controller.submitReview();
                      Get.back();
                    },
                    width: constrainedWidth - 40,
                    height: (constrainedHeight * 0.058).clamp(40, 50),
                    bgColor: AppColor.primary,
                    textColor: Colors.white,
                    borderRadius: 10,
                    borderColor: AppColor.primary,
                    fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: constrainedHeight * 0.03),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}