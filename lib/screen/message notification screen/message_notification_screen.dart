import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import '../../constant/custom_widget.dart';
import '../join chat screen/joinchat_screen.dart';
import 'message_notification_controller.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return GetBuilder<MessageScreenController>(
      init: Get.put(MessageScreenController()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.08), // Top spacing
                // Back Icon
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColor.black,
                        size: width * 0.06,
                      ),
                    ),
                  ),
                ),
                // Messages Title
                Text(
                  "Messages",
                  style: FTextStyle.custom(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: height * 0.03),
                // Search Text Field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomWidget.textInputFiled(
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
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                    prefixIconWidget: Icon(
                      Icons.search,
                      color: AppColor.black,
                      size: width * 0.06,
                    ),
                    onChanged: (value) {
                      controller.searchQuery.value = value;
                      controller.filterUsers();
                    },
                  ),
                ),
                // New Messages Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.02),
                      Text(
                        "New Messages",
                        style: FTextStyle.custom(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Obx(
                            () => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.filteredUsers.length,
                          itemBuilder: (context, index) {
                            final user = controller.filteredUsers[index];
                            return GestureDetector(
                              onTap: () => Get.to(() => JoinChatScreen(user: user)),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: height * 0.02),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Avatar with Status
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        CircleAvatar(
                                          radius: width * 0.07,
                                          backgroundImage: AssetImage(user['avatar']),
                                        ),
                                        Positioned(
                                          bottom: -9,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(
                                                color: AppColor.textFieldFill,
                                                width: 1,
                                              ),
                                            ),
                                            child: Text(
                                              user['status'],
                                              style: FTextStyle.custom(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.textfieldtextcolor,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: width * 0.045),
                                    // Username and Bio
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            user['username'],
                                            style: FTextStyle.custom(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.black,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: height * 0.005),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: width * 0.02,
                                                backgroundImage: AssetImage(user['avatar']),
                                              ),
                                              SizedBox(width: width * 0.02),
                                              Expanded(
                                                child: Text(
                                                  user['bio'],
                                                  style: FTextStyle.custom(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.black,
                                                  ),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Unread Count and Timestamp
                                    SizedBox(
                                      width: width * 0.2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          if (user['unreadCount'] > 0)
                                            Container(
                                              width: width * 0.05,
                                              height: width * 0.05,
                                              decoration: BoxDecoration(
                                                color: AppColor.primary,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  user['unreadCount'].toString(),
                                                  style: FTextStyle.custom(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(height: height * 0.01),
                                          Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            user['timestamp'],
                                            style: FTextStyle.custom(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.textfieldtextcolor,
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