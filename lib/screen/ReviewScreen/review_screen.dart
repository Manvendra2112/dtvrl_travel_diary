import 'package:dtvrl_travel_diary/screen/ReviewScreen/reviewscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';
import '../rate screen/ratereview_screen.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    double constrainedWidth = MediaQuery.of(context).size.width;
    double constrainedHeight = MediaQuery.of(context).size.height;

    return GetBuilder<ReviewScreenController>(
      init: ReviewScreenController(),
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
                       // onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColor.black,
                          size: (constrainedWidth * 0.07).clamp(24, 30),
                        ),
                      ),
                      SizedBox(width: constrainedWidth * 0.03),
                      Text(
                        "Reviews",
                        style: FTextStyle.custom(
                          fontSize: (constrainedWidth * 0.07).clamp(22, 24),
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: constrainedHeight * 0.03),
                  // Search Text Field
                  CustomWidget.textInputFiled(
                    controller.searchTextCon,
                    focusNode: controller.searchFocus,
                    textAlign: TextAlign.left,
                    topPadding: 0,
                    leftPadding: 0,
                    rightPadding: 0,
                    bottomPadding: 10,
                    blurRadius: 10,
                    borderRadius: 50,
                    fillColorFiled: true,
                    fillColors: AppColor.textFieldFill,
                    textInputType: TextInputType.text,
                    hintText: "Search Messages",
                    hintStyle: FTextStyle.custom(
                      fontSize: (constrainedWidth * 0.04).clamp(14, 15),
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                    prefixIconWidget: Icon(
                      Icons.search,
                      color: AppColor.black,
                      size: (constrainedWidth * 0.06).clamp(24, 30),
                    ),
                    onChanged: (value) {
                      controller.searchQuery.value = value;
                      controller.filterReviews();
                    },
                  ),
                  SizedBox(height: constrainedHeight * 0.02),
                  // Rate & Review Button
                  CustomWidget.elevatedCustomButton(
                    context,
                    "Rate & Review the Location",
                        () => Get.to(() => const RateReviewScreen()),
                    width: constrainedWidth - 40, // Same width as text field (minus padding)
                    height: (constrainedHeight * 0.059).clamp(40, 50),
                    bgColor: AppColor.primary,
                    textColor: Colors.white,
                    borderRadius: 10,
                    borderColor: AppColor.primary,
                    fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: constrainedHeight * 0.045),
                  // Trip Summary Section
                  Text(
                    "Shimla Trip Review",
                    style: FTextStyle.custom(
                      fontSize: (constrainedWidth * 0.03).clamp(17, 20),
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: constrainedHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shimla Trip",
                        style: FTextStyle.custom(
                          fontSize: (constrainedWidth * 0.06).clamp(16, 18),
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                      ),
                      Text(
                        "23 Fab - 28 Fab",
                        style: FTextStyle.custom(
                          fontSize: (constrainedWidth * 0.03).clamp(12, 16),
                          fontWeight: FontWeight.w600,
                          color: AppColor.textfieldtextcolor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: constrainedHeight * 0.02),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Les Bistronomes : ",
                              style: FTextStyle.custom(
                                fontSize: (constrainedWidth * 0.04).clamp(15  , 16),
                                fontWeight: FontWeight.w500,
                                color: AppColor.black,
                              ),
                            ),
                            SizedBox(width: constrainedWidth * 0.02),
                            Icon(
                              Icons.done_all,
                              color: AppColor.primary,
                              size: (constrainedWidth * 0.04).clamp(14, 18),
                            ),
                            SizedBox(width: constrainedWidth * 0.02),
                            Text(
                              "250",
                              style: FTextStyle.custom(
                                fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                                fontWeight: FontWeight.w500,
                                color: AppColor.black,
                              ),
                            ),
                            // Container(
                            //   //height: 1,
                            //   width: constrainedWidth * 0.2,
                            //   color: AppColor.textfieldtextcolor,
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              ImageAssets.star,
                              width: (constrainedWidth * 0.05).clamp(18, 22),
                              height: (constrainedWidth * 0.05).clamp(18, 22),
                            ),
                            SizedBox(width: constrainedWidth * 0.02),
                            Text(
                              "4.9/5.0",
                              style: FTextStyle.custom(
                                fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                                fontWeight: FontWeight.w500,
                                color: AppColor.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Review Section
                  Obx(
                        () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.filteredReviews.length,
                      itemBuilder: (context, index) {
                        final review = controller.filteredReviews[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: constrainedHeight * 0.02),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              border: Border.all(color: Color(0xFFD9D9D9), width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: (constrainedWidth * 0.07).clamp(24, 30),
                                      backgroundImage: AssetImage(review['avatar']),
                                    ),
                                    SizedBox(width: constrainedWidth * 0.03),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          review['username'],
                                          style: FTextStyle.customPreahvihear(
                                            fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.black,
                                          ),
                                        ),
                                        Text(
                                          "Posted : ${review['posted']}",
                                          style: FTextStyle.custom(
                                            fontSize: (constrainedWidth * 0.03).clamp(10, 12),
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.textfieldtextcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: constrainedHeight * 0.02),
                                Text(
                                  review['review'],
                                  style: FTextStyle.custom(
                                    fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                  ),
                                ),
                                SizedBox(height: constrainedHeight * 0.02),
                                Row(
                                  children: [
                                    Image.asset(
                                      ImageAssets.like,
                                      width: (constrainedWidth * 0.05).clamp(18, 22),
                                      height: (constrainedWidth * 0.05).clamp(18, 22),
                                    ),
                                    SizedBox(width: constrainedWidth * 0.02),
                                    Text(
                                      review['likes'],
                                      style: FTextStyle.custom(
                                        fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.black,
                                      ),
                                    ),
                                    SizedBox(width: constrainedWidth * 0.03),
                                    Image.asset(
                                      ImageAssets.comment,
                                      width: (constrainedWidth * 0.05).clamp(18, 22),
                                      height: (constrainedWidth * 0.05).clamp(18, 22),
                                    ),
                                    SizedBox(width: constrainedWidth * 0.02),
                                    Text(
                                      review['comments'],
                                      style: FTextStyle.custom(
                                        fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.black,
                                      ),
                                    ),
                                    SizedBox(width: constrainedWidth * 0.03),
                                    Image.asset(
                                      ImageAssets.tick,
                                      width: (constrainedWidth * 0.05).clamp(18, 22),
                                      height: (constrainedWidth * 0.05).clamp(18, 22),
                                    ),
                                    SizedBox(width: constrainedWidth * 0.02),
                                    Text(
                                      review['ticks'],
                                      style: FTextStyle.custom(
                                        fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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

