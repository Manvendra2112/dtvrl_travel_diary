import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';
import 'otherprofile_controller.dart';

class OtherProfileScreen extends StatelessWidget {
  final String username;
  final String avatar;
  final int followers;

  const OtherProfileScreen({
    super.key,
    required this.username,
    required this.avatar,
    required this.followers,
  });

  // Widget for each trip card in Timeline tab
  Widget _buildTripCard(String imagePath, String title, String date) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 100,
              width: 100,
              color: Colors.grey,
              child: Icon(Icons.image, color: AppColor.white),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: FTextStyle.custom(fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.black),
        ),
        Text(
          date,
          style: FTextStyle.custom(fontSize: 12, fontWeight: FontWeight.w400, color: AppColor.textfieldtextcolor),
        ),
      ],
    );
  }

  // Widget for each post image in Post tab
  Widget _buildPostImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        height: 120,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: 120,
          color: Colors.grey,
          child: Icon(Icons.image, color: AppColor.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return GetBuilder<OtherProfileScreenController>(
      init: Get.put(OtherProfileScreenController(
        username: username,
        avatar: avatar,
        followers: followers,
      )),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.05),
                // Back button
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColor.black),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                // Username
                Text(
                  controller.username,
                  style: FTextStyle.custom(fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.black),
                ),
                SizedBox(height: height * 0.01),
                // Profile image
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage(controller.avatar),
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                // Email
                Text(
                  controller.email,
                  style: FTextStyle.custom(fontSize: 15, fontWeight: FontWeight.w400, color: AppColor.black),
                ),
                SizedBox(height: height * 0.001),
                // View Timelines link
                Text(
                  'View Timelines',
                  style: FTextStyle.custom(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0075FF),
                  ).copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff0075FF),
                    decorationThickness: 2,
                  ),
                ),
                SizedBox(height: height * 0.03),
                // Followers and Following containers
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Followers - ${controller.followers}k",
                              style: FTextStyle.custom(fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Following - ${controller.following}",
                              style: FTextStyle.custom(fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.01),
                // Tabs
                TabBar(
                  controller: controller.tabController,
                  labelColor: AppColor.black,
                  unselectedLabelColor: AppColor.black.withOpacity(0.6),
                  labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  indicatorColor: AppColor.primary,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(text: "Profile"),
                    Tab(text: "Timeline"),
                    Tab(text: "Post"),
                  ],
                ),
                // Tab Views
                SizedBox(
                  height: height * 0.6,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      // Profile Tab
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              SizedBox(height: height * 0.03),
                              // Travel Days container
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: AppColor.lightCyanWithOpacity,
                                  border: Border.all(color: AppColor.primary, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              ImageAssets.footsteps,
                                              height: 70,
                                              width: 60,
                                              errorBuilder: (context, error, stackTrace) => Icon(Icons.directions_walk),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "30",
                                              style: FTextStyle.custom(fontSize: 25, fontWeight: FontWeight.w600, color: AppColor.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: width * 0.15),
                                        Text(
                                          "${controller.travelDays}",
                                          style: FTextStyle.custom(fontSize: 25, fontWeight: FontWeight.w600, color: AppColor.black),
                                        ),
                                        Text(
                                          "Travel Days",
                                          style: FTextStyle.custom(fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.02),
                              // Itinerary Submitted container
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: AppColor.lightCyanWithOpacity,
                                  border: Border.all(color: AppColor.primary, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      ImageAssets.itineraryIcon,
                                      height: 16,
                                      width: 16,
                                      errorBuilder: (context, error, stackTrace) => Icon(Icons.list),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Itinerary Submitted - ${controller.itinerariesSubmitted}",
                                      style: FTextStyle.custom(fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.02),
                              // Review Submitted container
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: AppColor.lightCyanWithOpacity,
                                  border: Border.all(color: AppColor.primary, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      ImageAssets.reviewIcon,
                                      height: 16,
                                      width: 16,
                                      errorBuilder: (context, error, stackTrace) => Icon(Icons.star),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Review Submitted - ${controller.reviewsSubmitted}",
                                      style: FTextStyle.custom(fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.03),
                              // Motivation text
                              Padding(
                                padding: EdgeInsets.only(right: width * 0.29),
                                child: Text(
                                  "What’s Motivates you to Travel?",
                                  style: FTextStyle.custom(fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.black),
                                ),
                              ),
                              SizedBox(height: height * 0.013),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: AppColor.lightCyanWithOpacity,
                                  border: Border.all(color: AppColor.primary, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.motivation,
                                    style: FTextStyle.custom(fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.black),
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.03),
                            ],
                          ),
                        ),
                      ),
                      // Timeline Tab
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              SizedBox(height: height * 0.03),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildTripCard(ImageAssets.tripImage1, "Goa Trip", "23 Feb - 28 Feb"),
                                  _buildTripCard(ImageAssets.tripImage2, "Goa Trip", "23 Feb - 28 Feb"),
                                  _buildTripCard(ImageAssets.tripImage3, "Goa Trip", "23 Feb - 28 Feb"),
                                ],
                              ),
                              SizedBox(height: height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildTripCard(ImageAssets.tripImage3, "Goa Trip", "23 Feb - 28 Feb"),
                                  _buildTripCard(ImageAssets.tripImage2, "Goa Trip", "23 Feb - 28 Feb"),
                                  _buildTripCard(ImageAssets.tripImage1, "Goa Trip", "23 Feb - 28 Feb"),
                                ],
                              ),
                              SizedBox(height: height * 0.03),
                            ],
                          ),
                        ),
                      ),
                      // Post Tab
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              SizedBox(height: height * 0.03),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: _buildPostImage(ImageAssets.postImage1)),
                                  SizedBox(width: 10),
                                  Expanded(child: _buildPostImage(ImageAssets.postImage2)),
                                  SizedBox(width: 10),
                                  Expanded(child: _buildPostImage(ImageAssets.tripImage1)),
                                ],
                              ),
                              SizedBox(height: height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: _buildPostImage(ImageAssets.tripImage2)),
                                  SizedBox(width: 10),
                                  Expanded(child: _buildPostImage(ImageAssets.tripImage2)),
                                  SizedBox(width: 10),
                                  Expanded(child: _buildPostImage(ImageAssets.tripImage3)),
                                ],
                              ),
                              SizedBox(height: height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: _buildPostImage(ImageAssets.postImage1)),
                                  SizedBox(width: 10),
                                  Expanded(child: _buildPostImage(ImageAssets.tripImage3)),
                                  SizedBox(width: 10),
                                  Expanded(child: _buildPostImage(ImageAssets.postImage2)),
                                ],
                              ),
                              SizedBox(height: height * 0.03),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}