import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import '../../constant/custom_widget.dart';
import '../bottomnavbar/bottomnavbar_controller.dart';
import '../bottomnavbar/bottomnavbar_screen.dart';

class MapScreenController extends GetxController {
  // Text controller for search
  final TextEditingController searchTextCon = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  // Text controller for description
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode descriptionFocus = FocusNode(); // Add FocusNode for TextField

  // Scroll controller for bottom sheet
  final ScrollController scrollController = ScrollController();

  // Search query
  String searchQuery = '';

  // Dates
  DateTime? startDate;
  DateTime? endDate;

  // Mock places for search (not displayed but for functionality)
  List<String> places = ['Shimla', 'Manali', 'Delhi', 'Mumbai'];

  // Filter places (mock functionality)
  void filterPlaces() {
    print("Filtering places with query: $searchQuery");
  }

  // Show bottom sheet
  void showFootprintBottomSheet(BuildContext context) {
    double constrainedWidth = MediaQuery.of(context).size.width;
    double constrainedHeight = MediaQuery.of(context).size.height;

    // Listen for focus changes to scroll TextField into view
    descriptionFocus.addListener(() {
      if (descriptionFocus.hasFocus) {
        Future.delayed(Duration(milliseconds: 300), () {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      }
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow full height for keyboard
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return GetBuilder<MapScreenController>(
          builder: (controller) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets, // Adjust for keyboard
              child: SingleChildScrollView(
                controller: scrollController, // Add ScrollController
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20), // Consistent horizontal padding
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: constrainedHeight * 0.03), // Consistent top padding
                      // Header
                      Text(
                        "Add Travel Date",
                        style: FTextStyle.custom(
                          fontSize: (constrainedWidth * 0.05).clamp(18, 20),
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: constrainedHeight * 0.03), // Consistent spacing
                      // Description
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: FTextStyle.custom(
                          fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                          fontWeight: FontWeight.w400,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: constrainedHeight * 0.03), // Consistent spacing
                      // Description Text Field
                      TextField(
                        controller: descriptionController,
                        focusNode: descriptionFocus, // Add FocusNode
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Add Text...",
                          hintStyle: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                            fontWeight: FontWeight.w400,
                            color: AppColor.textfieldtextcolor,
                          ),
                          filled: true,
                          fillColor: Color(0x1A3BC6C5), // #3BC6C5 with 10% opacity
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: constrainedHeight * 0.03), // Consistent spacing
                      // Date Selection
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Start Date Container
                          Container(
                            width: (constrainedWidth * 0.4).clamp(150, 180),
                            height: (constrainedHeight * 0.06).clamp(40, 50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColor.primary, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    startDate == null
                                        ? "Start Date"
                                        : "${startDate!.day}/${startDate!.month}/${startDate!.year}",
                                    style: FTextStyle.custom(
                                      fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.primary, // Updated text color
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (pickedDate != null) {
                                      controller.startDate = pickedDate;
                                      controller.update();
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: AppColor.primary,
                                      size: (constrainedWidth * 0.05).clamp(18, 22),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // End Date Container
                          Container(
                            width: (constrainedWidth * 0.4).clamp(150, 180),
                            height: (constrainedHeight * 0.06).clamp(40, 50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColor.primary, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    endDate == null
                                        ? "End Date"
                                        : "${endDate!.day}/${endDate!.month}/${endDate!.year}",
                                    style: FTextStyle.custom(
                                      fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.primary, // Updated text color
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (pickedDate != null) {
                                      controller.endDate = pickedDate;
                                      controller.update();
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: AppColor.primary,
                                      size: (constrainedWidth * 0.05).clamp(18, 22),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: constrainedHeight * 0.03), // Consistent spacing
                      // Buttons (aligned directly below date containers)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align buttons with date containers
                        children: [
                          // Cancel Button
                          CustomWidget.elevatedCustomButton(
                            context,
                            "Cancel",
                                () => Get.back(),
                            width: (constrainedWidth * 0.4).clamp(150, 180), // Match date container width
                            height: (constrainedHeight * 0.05).clamp(35, 45),
                            bgColor: Colors.white,
                            textColor: AppColor.black,
                            borderRadius: 10,
                            fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                            weight: FontWeight.w600,
                            borderColor: AppColor.primary,
                          ),
                          // Save Button
                          CustomWidget.elevatedCustomButton(
                            context,
                            "Save",
                                () {
                              controller.saveFootprint();
                              // Navigate to BottomNavScreen with index 0 (HomeScreen)
                              Get.off(() => const BottomNavScreen(), arguments: 0);
                              Get.find<BottomNavController>().changeTab(0);
                            },
                            width: (constrainedWidth * 0.4).clamp(150, 180), // Match date container width
                            height: (constrainedHeight * 0.05).clamp(35, 45),
                            bgColor: AppColor.primary,
                            textColor: Colors.white,
                            borderRadius: 10,
                            fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                            weight: FontWeight.w600,
                            borderColor: Colors.transparent,
                          ),
                        ],
                      ),
                      SizedBox(height: constrainedHeight * 0.03), // Consistent bottom padding
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Save footprint (mock functionality)
  void saveFootprint() {
    if (descriptionController.text.trim().isEmpty || startDate == null || endDate == null) {
      Get.snackbar(
        "Error",
        "Please fill all fields and select dates.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    print("Footprint saved: Description: ${descriptionController.text}, Start Date: $startDate, End Date: $endDate");
  }

  @override
  void onClose() {
    searchTextCon.dispose();
    searchFocus.dispose();
    descriptionController.dispose();
    descriptionFocus.dispose();
    scrollController.dispose();
    super.onClose();
  }
}