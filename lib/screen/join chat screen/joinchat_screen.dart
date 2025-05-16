import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';
import '../chat screen/chat_screen.dart';
import 'joinchatscreen_controller.dart';


class JoinChatScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const JoinChatScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    // Constrain sizes for responsiveness
    double constrainedWidth = MediaQuery.of(context).size.width;
    double constrainedHeight = MediaQuery.of(context).size.height;

    return GetBuilder<JoinChatScreenController>(
      init: Get.put(JoinChatScreenController()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: Column(
            children: [
              // Header Section (Fixed Height)
              SizedBox(
                height: constrainedHeight * 0.19,
                child: Container(
                  color: Color(0x5CD9D9D9), // #d9d9d9 with 36% opacity
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: constrainedHeight * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColor.black,
                          size: (constrainedWidth * 0.07).clamp(24, 30),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Group Chat",
                            style: FTextStyle.custom(
                              fontSize: (constrainedWidth * 0.05).clamp(18, 20),
                              fontWeight: FontWeight.w600,
                              color: AppColor.black,
                            ),
                          ),
                          SizedBox(height: constrainedHeight * 0.01),
                          Image.asset(
                            ImageAssets.groupChat,
                            width: (constrainedWidth * 0.15).clamp(40, 60),
                            height: (constrainedWidth * 0.15).clamp(40, 60),
                          ),
                        ],
                      ),
                      SizedBox(width: constrainedWidth * 0.06), // Spacer
                    ],
                  ),
                ),
              ),
              // Main Section (Flexible)
              Expanded(
                child: Container(
                  color: AppColor.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: constrainedHeight * 0.05),
                        Text(
                          "Welcome to Group Chat",
                          style: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.055).clamp(20, 22),
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                        ),
                        SizedBox(height: constrainedHeight * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            style: FTextStyle.custom(
                              fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                              fontWeight: FontWeight.w400,
                              color: AppColor.textfieldtextcolor,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: constrainedHeight * 0.02),
                        Image.asset(
                          ImageAssets.welcome,
                          width: (constrainedWidth * 0.3).clamp(100, 150),
                          height: (constrainedWidth * 0.2).clamp(60, 100),
                        ),
                        SizedBox(height: (constrainedHeight * 0.33).clamp(100, 300)),
                        Text(
                          "“Request to Join a Group”",
                          style: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.045).clamp(16, 18),
                            fontWeight: FontWeight.w500,
                            color: AppColor.textfieldtextcolor,
                          ),
                        ),
                        SizedBox(height: constrainedHeight * 0.046),
                      ],
                    ),
                  ),
                ),
              ),
              // Footer Section (Fixed Height)
              SizedBox(
                height: constrainedHeight * 0.12,
                child: Container(
                  color: Color(0x5CD9D9D9), // #d9d9d9 with 36% opacity
                  padding: EdgeInsets.symmetric(vertical: constrainedHeight * 0.03),
                  child: Center(
                    child: CustomWidget.elevatedCustomButton(
                      context,
                      "Join Group",
                          () => Get.to(() => ChatScreen(user: user)),
                      width: (constrainedWidth * 0.84).clamp(200, 400),
                      height: (constrainedHeight * 0.058).clamp(40, 50),
                      bgColor: AppColor.primary,
                      textColor: Colors.white,
                      borderRadius: 10,
                      fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                      borderColor: AppColor.primary,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}