import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';
import 'notification_screen_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return GetBuilder<NotificationScreenController>(
      init: Get.put(NotificationScreenController()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.08), // Top spacing
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColor.black,
                          size: width * 0.06,
                        ),
                      ),
                      Icon(
                        Icons.more_vert,
                        color: AppColor.black,
                        size: width * 0.06,
                      ),
                    ],
                  ),
                  // Title
                  Center(
                    child: Text(
                      "Notifications",
                      style: FTextStyle.custom(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Notification List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.notifications.length,
                    itemBuilder: (context, index) {
                      final notification = controller.notifications[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: height * 0.02),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: AppColor.primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(width * 0.03),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Notification Icon
                                    Image.asset(
                                      ImageAssets.notifications,
                                      width: width * 0.075,
                                      height: width * 0.075,
                                    ),
                                    SizedBox(width: 8,),
                                    Text(
                                      notification['message']!,
                                      style: FTextStyle.custom(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.black,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                // Message and Timestamp
                                Text(
                                  notification['timestamp']!,
                                  style: FTextStyle.custom(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.textfieldtextcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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