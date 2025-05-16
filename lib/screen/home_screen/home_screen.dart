import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';
import '../Other Profile Screen/other_profile_screen.dart';
import '../message notification screen/message_notification_screen.dart';
import '../notification screen/notification_screen.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return GetBuilder<HomeScreenController>(
      init: Get.put(HomeScreenController()),
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
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Avatar with Edit Icon
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Obx(
                                () => CircleAvatar(
                              radius: width * 0.07,
                              backgroundImage: controller.profileImagePath.value.isEmpty
                                  ? AssetImage(ImageAssets.avatar)
                                  : FileImage(File(controller.profileImagePath.value)),
                            ),
                          ),
                          Positioned(
                            top: 35,
                            right: -6,
                            child: GestureDetector(
                              onTap: () => controller.pickProfileImage(),
                              child: Container(
                                width: width * 0.05,
                                height: width * 0.05,
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: width * 0.03,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // DTVRL Text
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.3),
                        child: Text(
                          "DTVRL",
                          style: FTextStyle.customPreahvihear(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                        ),
                      ),
                      // Message and Notification Icons
                      Row(
                        children: [
                          // Message Icon with Count
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(() => const MessageScreen()),
                                child: Container(
                                  width: width * 0.09,
                                  height: width * 0.09,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      ImageAssets.message,
                                      width: width * 0.04,
                                      height: width * 0.04,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -8,
                                right: -8,
                                child: Container(
                                  width: width * 0.05,
                                  height: width * 0.05,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFF6F59),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Obx(
                                          () => Text(
                                        controller.messageCount.value.toString(),
                                        style: FTextStyle.custom(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: width * 0.03),
                          // Notification Icon with Count
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(() => const NotificationScreen()),
                                child: Container(
                                  width: width * 0.09,
                                  height: width * 0.09,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      ImageAssets.notification,
                                      width: width * 0.04,
                                      height: width * 0.04,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -8,
                                right: -8,
                                child: Container(
                                  width: width * 0.05,
                                  height: width * 0.05,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFF6F59),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Obx(
                                          () => Text(
                                        controller.notificationCount.value.toString(),
                                        style: FTextStyle.custom(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
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
                    hintText: "Search People.....",
                    hintStyle: FTextStyle.custom(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                    prefixIconWidget: Icon(
                      Icons.search,
                      color: AppColor.black,
                      size: width * 0.06,
                    ),
                  ),
                  // Search Results
                  Obx(() => controller.filteredUsers.isNotEmpty
                      ? Container(
                    constraints: BoxConstraints(maxHeight: height * 0.3),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user = controller.filteredUsers[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => OtherProfileScreen(
                              username: user['username'],
                              avatar: user['avatar'],
                              followers: user['followers'],
                            ));
                            controller.searchTextCon.clear();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(user['avatar']),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user['username'],
                                      style: FTextStyle.customPreahvihear(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Followed By ${user['followers']}k People",
                                      style: FTextStyle.custom(
                                        fontSize: 12,
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
                  )
                      : SizedBox.shrink()),
                  // Post List
                  Obx(() => controller.filteredUsers.isEmpty
                      ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.posts.length,
                    itemBuilder: (context, index) {
                      final post = controller.posts[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: height * 0.02),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(width * 0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // User Info Row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: width * 0.06,
                                        backgroundImage: AssetImage(post['avatar']),
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Text(
                                        post['username'],
                                        style: FTextStyle.customPreahvihear(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: AppColor.black,
                                    size: width * 0.06,
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.02),
                              // Post Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  post['image'],
                                  width: double.infinity,
                                  height: height * 0.35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: height * 0.02),
                              // Actions Row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImageAssets.like,
                                        width: width * 0.05,
                                        height: width * 0.05,
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Text(
                                        post['likes'].toString(),
                                        style: FTextStyle.custom(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.black,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.04),
                                      Image.asset(
                                        ImageAssets.comment,
                                        width: width * 0.05,
                                        height: width * 0.05,
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Text(
                                        post['comments'].toString(),
                                        style: FTextStyle.custom(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    ImageAssets.share,
                                    width: width * 0.05,
                                    height: width * 0.05,
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.01),
                              // Description
                              Text(
                                post['description'],
                                style: FTextStyle.custom(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.black,
                                ),
                              ),
                              SizedBox(height: height * 0.005),
                              // Timestamp
                              Text(
                                post['timestamp'],
                                style: FTextStyle.custom(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                      : SizedBox.shrink()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}