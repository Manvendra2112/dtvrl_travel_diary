import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';

import 'itineraryscreen_controller.dart';

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double constrainedWidth = width;
    double constrainedHeight = height;

    return GetBuilder<ItineraryScreenController>(
      init: ItineraryScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: constrainedHeight * 0.08), // Space from top
                  // Header Row
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                         // onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColor.black,
                            size: (constrainedWidth * 0.07).clamp(24, 30),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // More options (mocked for now)
                            print("More options tapped");
                          },
                          child: Icon(
                            Icons.more_vert,
                            color: AppColor.black,
                            size: (constrainedWidth * 0.07).clamp(24, 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Title
                  Text(
                    "My Itinerary",
                    style: FTextStyle.custom(
                      fontSize: (constrainedWidth * 0.06).clamp(22, 24),
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: constrainedHeight * 0.03),
                  // Tabs Row
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // My Itinerary Tab
                        GestureDetector(
                          onTap: () => controller.changeTab(0),
                          child: Container(
                            width: (constrainedWidth * 0.28).clamp(100, 120),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: controller.currentTab == 0
                                  ? AppColor.primary
                                  : Colors.white,
                              border: Border.all(
                                  color: AppColor.primary, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "My Itinerary",
                                style: FTextStyle.custom(
                                  fontSize:
                                  (constrainedWidth * 0.035).clamp(12, 14),
                                  fontWeight: FontWeight.w500,
                                  color: controller.currentTab == 0
                                      ? Colors.white
                                      : AppColor.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Search Review Tab
                        GestureDetector(
                          onTap: () => controller.changeTab(1),
                          child: Container(
                            width: (constrainedWidth * 0.28).clamp(100, 120),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: controller.currentTab == 1
                                  ? AppColor.primary
                                  : Colors.white,
                              border: Border.all(
                                  color: AppColor.primary, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Search Review",
                                style: FTextStyle.custom(
                                  fontSize:
                                  (constrainedWidth * 0.035).clamp(12, 14),
                                  fontWeight: FontWeight.w500,
                                  color: controller.currentTab == 1
                                      ? Colors.white
                                      : AppColor.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Share Image Tab
                        GestureDetector(
                          onTap: () => controller.changeTab(2),
                          child: Container(
                            width: (constrainedWidth * 0.28).clamp(100, 120),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: controller.currentTab == 2
                                  ? AppColor.primary
                                  : Colors.white,
                              border: Border.all(
                                  color: AppColor.primary, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Image.asset(
                                ImageAssets.shareNew,
                                width: (constrainedWidth * 0.05).clamp(20, 24),
                                height: (constrainedWidth * 0.05).clamp(20, 24),
                                color: controller.currentTab == 2
                                    ? Colors.white
                                    : AppColor.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constrainedHeight * 0.02),
                  // Tab Content
                  Expanded(
                    child: IndexedStack(
                      index: controller.currentTab,
                      children: [
                        // My Itinerary Tab
                        buildItineraryTab(controller, constrainedWidth,
                            constrainedHeight, context),
                        // Search Review Tab (same UI for now)
                        buildItineraryTab(controller, constrainedWidth,
                            constrainedHeight, context),
                        // Share Image Tab (same UI for now)
                        shareItineraryTab(controller, constrainedWidth,
                            constrainedHeight, context),
                      ],
                    ),
                  ),
                ],
              ),
              // Floating Add Button (Bottom Right)
              if (controller.currentTab != 2)
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () => controller.showCreateItineraryPopup(context),
                    child: Container(
                      width: (constrainedWidth * 0.15).clamp(50, 60),
                      height: (constrainedWidth * 0.15).clamp(50, 60),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: (constrainedWidth * 0.08).clamp(28, 32),
                        ),
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


  // Build the Itinerary Tab UI (reused across all tabs for now)
  Widget buildItineraryTab(ItineraryScreenController controller,
      double constrainedWidth, double constrainedHeight, BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: controller.itineraries.length,
      itemBuilder: (context, index) {
        var itinerary = controller.itineraries[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColor.lightCyanWithOpacity, // #3BC6C5 with 10% opacity
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Destination and People Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itinerary['destination'],
                      style: FTextStyle.custom(
                        fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          ImageAssets.person,
                          width: (constrainedWidth * 0.06).clamp(20, 24),
                          height: (constrainedWidth * 0.06).clamp(20, 24),
                        ),
                        SizedBox(width: 5),
                        Text(
                          itinerary['people'],
                          style: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: constrainedHeight * 0.015),
                // Amount
                Text(
                  itinerary['amount'],
                  style: FTextStyle.custom(
                    fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                    fontWeight: FontWeight.w600,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: constrainedHeight * 0.015),
                // Description
                Text(
                  itinerary['description'],
                  style: FTextStyle.custom(
                    fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                    fontWeight: FontWeight.w400,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: constrainedHeight * 0.015),
                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Message action (mocked for now)
                        print("Message tapped for ${itinerary['destination']}");
                      },
                      child: Image.asset(
                        ImageAssets.messageNew,
                        width: (constrainedWidth * 0.08).clamp(24, 29),
                        height: (constrainedWidth * 0.08).clamp(24, 29),
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () =>
                          controller.showSharePopup(context, itinerary),
                      child: Image.asset(
                        ImageAssets.newShare,
                        width: (constrainedWidth * 0.08).clamp(24, 29),
                        height: (constrainedWidth * 0.08).clamp(24, 29),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  // Build the Share Itinerary Tab UI (for Share image tab)
  Widget shareItineraryTab(ItineraryScreenController controller,
      double constrainedWidth, double constrainedHeight, BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: controller.itineraries.length,
      itemBuilder: (context, index) {
        var itinerary = controller.itineraries[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColor.lightCyanWithOpacity,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Destination and People Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itinerary['destination'],
                      style: FTextStyle.custom(
                        fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          ImageAssets.person,
                          width: (constrainedWidth * 0.06).clamp(20, 24),
                          height: (constrainedWidth * 0.06).clamp(20, 24),
                        ),
                        SizedBox(width: 5),
                        Text(
                          itinerary['people'],
                          style: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: constrainedHeight * 0.015),
                // Amount
                Text(
                  itinerary['amount'],
                  style: FTextStyle.custom(
                    fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                    fontWeight: FontWeight.w600,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: constrainedHeight * 0.015),
                // Description
                Text(
                  itinerary['description'],
                  style: FTextStyle.custom(
                    fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                    fontWeight: FontWeight.w400,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: constrainedHeight * 0.02),
                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Message action (mocked for now)
                        print("Message tapped for ${itinerary['destination']}");
                      },
                      child: Image.asset(
                        ImageAssets.like,
                        width: (constrainedWidth * 0.05).clamp(20, 24),
                        height: (constrainedWidth * 0.05).clamp(20, 24),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '100',
                      style: FTextStyle.custom(
                        fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                        fontWeight: FontWeight.w500,
                        color: AppColor.black,
                      ),
                    ),
                    SizedBox(width: 20),


                    GestureDetector(
                      onTap: () =>
                          controller.showSharePopup(context, itinerary),
                      child: Image.asset(
                        ImageAssets.comment,
                        width: (constrainedWidth * 0.06).clamp(20, 24),
                        height: (constrainedWidth * 0.06).clamp(20, 24),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '210',
                      style: FTextStyle.custom(
                        fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                        fontWeight: FontWeight.w500,
                        color: AppColor.black,
                      ),
                    ),
                    SizedBox(width: 20),


                    GestureDetector(
                      onTap: () =>
                          controller.showSharePopup(context, itinerary),
                      child: Image.asset(
                        ImageAssets.tick,
                        width: (constrainedWidth * 0.06).clamp(20, 24),
                        height: (constrainedWidth * 0.06).clamp(20, 24),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '240',
                      style: FTextStyle.custom(
                        fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                        fontWeight: FontWeight.w500,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,)
              ],
            ),
          ),
        );
      },
    );
  }
}
