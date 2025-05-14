import 'package:dtvrl_travel_diary/screen/chat%20screen/chatscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';

class ChatScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const ChatScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    // Constrain sizes for responsiveness
    double constrainedWidth = MediaQuery.of(context).size.width;
    double constrainedHeight = MediaQuery.of(context).size.height;

    return GetBuilder<ChatScreenController>(
      init: Get.put(ChatScreenController()),
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
                  child: Obx(
                        () => ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      itemCount: controller.messages.length,
                      itemBuilder: (context, index) {
                        final message = controller.messages[index];
                        bool isCurrentUser = message['isCurrentUser'] ?? false;
                        return Padding(
                          padding: EdgeInsets.only(bottom: constrainedHeight * 0.02),
                          child: Row(
                            mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: constrainedWidth * 0.7, // Limit container width to 70% of screen
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0x1A3BC6C5), // #3BC6C5 with 10% opacity
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: (constrainedWidth * 0.07).clamp(24, 30),
                                            backgroundImage: AssetImage(message['avatar']),
                                          ),
                                          SizedBox(width: constrainedWidth * 0.03),
                                          Text(
                                            message['sender'],
                                            style: FTextStyle.custom(
                                              fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        message['message'],
                                        style: FTextStyle.custom(
                                          fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.black,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            message['timestamp'],
                                            style: FTextStyle.custom(
                                              fontSize: (constrainedWidth * 0.03).clamp(10, 12),
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.textfieldtextcolor,
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          if (message['seen'] == true)
                                            Icon(
                                              Icons.done_all,
                                              color: Color(0xFF00C4CC),
                                              size: (constrainedWidth * 0.04).clamp(14, 18),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // Footer Section (Fixed Height)
              SizedBox(
                height: constrainedHeight * 0.14,
                child: Container(
                  color: Color(0x5CD9D9D9), // #d9d9d9 with 36% opacity
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: constrainedHeight * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: constrainedWidth * 0.8, // Reduce text field width to 80% of screen
                        child: CustomWidget.textInputFiled(
                          controller.messageController,
                          hintText: "Type Something..",
                          //borderRadius: 30,
                          //Adjusted for better proportionality
                          blurRadius: 20,
                          fillColorFiled: true,
                          fillColors: Colors.white,
                          hintStyle: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.03).clamp(14, 16),
                            fontWeight: FontWeight.w600,
                            color: AppColor.textfieldtextcolor,
                          ),
                          prefixIconWidget: GestureDetector(
                            onTap: controller.openImagePicker,
                            child: Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.white,
                                border: Border.all(
                                  color: AppColor.black,
                                  width: 1
                                )
                              ),
                              child: Icon(
                                Icons.add,
                                color: AppColor.textfieldtextcolor,
                                size: (constrainedWidth * 0.06).clamp(20, 24),
                              ),
                            ),
                          ),
                          suffixIconWidget: GestureDetector(
                            onTap: controller.sendMessage,
                            child: Icon(
                              Icons.send,
                              color: AppColor.primary,
                              size: (constrainedWidth * 0.06).clamp(20, 24),
                            ),
                          ),
                        ),
                      ),
                    ],
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