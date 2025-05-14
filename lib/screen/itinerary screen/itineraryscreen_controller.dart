import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';

class ItineraryScreenController extends GetxController {
  int currentTab = 0;

  // Mocked itinerary data
  List<Map<String, dynamic>> itineraries = [
    {
      'destination': 'Bali',
      'people': '277',
      'amount': 'INR 2000.00',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    },
    {
      'destination': 'Paris',
      'people': '150',
      'amount': 'INR 3000.00',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    },
    {
      'destination': 'Tokyo',
      'people': '320',
      'amount': 'INR 2500.00',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    },
  ];

  // Text controllers for Create Itinerary pop-up
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // Dates for Create Itinerary pop-up
  DateTime? startDate;
  DateTime? endDate;

  // Text controller for Share pop-up
  final TextEditingController usernameController = TextEditingController();

  void changeTab(int index) {
    currentTab = index;
    update();
  }

  // Show Share pop-up
  void showSharePopup(BuildContext context, Map<String, dynamic> itinerary) {
    double constrainedWidth = MediaQuery.of(context).size.width;
    double constrainedHeight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Container(
            width: (constrainedWidth * 0.7).clamp(250, 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // TextField and Share Icon Row
                SizedBox(height: constrainedHeight * 0.03),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: (constrainedWidth * 0.4).clamp(180, 220), // Reduced width to fit share icon
                          child: TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: "Enter Username",
                              hintStyle: FTextStyle.custom(
                                fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                                fontWeight: FontWeight.w400,
                                color: AppColor.black,
                              ),
                              filled: true,
                              fillColor: AppColor.lightCyanWithOpacity,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          "Share with all Users",
                          style: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                            fontWeight: FontWeight.w500,
                            color: AppColor.black,
                          ),
                        ),


                      ],
                    ),
                    SizedBox(width: 30,),
                    Column(

                      children: [
                        GestureDetector(
                          onTap: () {
                            print(
                                "Share tapped for username: ${usernameController.text}");
                            Get.back();
                          },
                          child: Icon(
                            Icons.share,
                            color: AppColor.primary,
                            size: (constrainedWidth * 0.07).clamp(24, 30),
                          ),
                        ),
                        SizedBox(height: 40,),
                        GestureDetector(
                          onTap: () {
                            print("Share with all users tapped");
                            Get.back();
                          },
                          child: Icon(
                            Icons.share,
                            color: AppColor.primary,
                            size: (constrainedWidth * 0.06).clamp(20, 24),
                          ),
                        ),


                      ],
                    )
                  ],
                ),
                // Share with All Users Row
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SizedBox(width: 10),
                //   ],
                // ),
                SizedBox(height: constrainedHeight * 0.02),
              ],
            ),
          ),
        );
      },
    );
  }
  // Show Create Itinerary pop-up
  void showCreateItineraryPopup(BuildContext context) {
    double constrainedWidth = MediaQuery.of(context).size.width;
    double constrainedHeight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.white,
          content: GetBuilder<ItineraryScreenController>(
            builder: (controller) {
              return Container(
                width: (constrainedWidth * 0.8).clamp(300, 350),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: constrainedHeight * 0.02),
                      // Header Row
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
                            "Create Itinerary",
                            style: FTextStyle.custom(
                              fontSize: (constrainedWidth * 0.05).clamp(18, 20),
                              fontWeight: FontWeight.w600,
                              color: AppColor.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: constrainedHeight * 0.03),
                      // Title TextField
                      TextField(
                        controller: controller.titleController,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Add Title...",
                          hintStyle: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: AppColor.primary, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: AppColor.primary, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: AppColor.primary, width: 1),
                          ),
                        ),
                      ),
                      SizedBox(height: constrainedHeight * 0.03),
                      // Amount TextField
                      TextField(
                        controller: controller.amountController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Add Amount .INR",
                          hintStyle: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.035).clamp(12, 14),
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: AppColor.primary, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: AppColor.primary, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: AppColor.primary, width: 1),
                          ),
                        ),
                      ),
                      SizedBox(height: constrainedHeight * 0.02),
                      // Trip Date Label
                      Text(
                        "Trip Date",
                        style: FTextStyle.custom(
                          fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: constrainedHeight * 0.02),
                      // Date Selection
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Start Date Container
                          Container(
                            width: (constrainedWidth * 0.3).clamp(100, 120),
                            height: (constrainedHeight * 0.06).clamp(40, 50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: AppColor.primary, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    controller.startDate == null
                                        ? "Start Date"
                                        : "${controller.startDate!.day}/${controller.startDate!.month}/${controller.startDate!.year}",
                                    style: FTextStyle.custom(
                                      fontSize:
                                      (constrainedWidth * 0.03).clamp(10, 12),
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.primary,
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
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: AppColor.primary,
                                      size: (constrainedWidth * 0.05).clamp(16, 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // End Date Container
                          Container(
                            width: (constrainedWidth * 0.3).clamp(100, 120),
                            height: (constrainedHeight * 0.06).clamp(40, 50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: AppColor.primary, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    controller.endDate == null
                                        ? "End Date"
                                        : "${controller.endDate!.day}/${controller.endDate!.month}/${controller.endDate!.year}",
                                    style: FTextStyle.custom(
                                      fontSize:
                                      (constrainedWidth * 0.03).clamp(10, 12),
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.primary,
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
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: AppColor.primary,
                                      size: (constrainedWidth * 0.05).clamp(16, 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: constrainedHeight * 0.03),
                      // Create Itinerary Button
                      Center(
                        child: SizedBox(
                          width: (constrainedWidth * 0.8).clamp(300, 350),
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.titleController.text.isEmpty ||
                                  controller.amountController.text.isEmpty ||
                                  controller.startDate == null ||
                                  controller.endDate == null) {
                                Get.snackbar(
                                  "Error",
                                  "Please fill all fields and select dates.",
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                                return;
                              }
                              controller.addItinerary();
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Create Itinerary",
                              style: FTextStyle.custom(
                                fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: constrainedHeight * 0.02),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // Add new itinerary
  void addItinerary() {
    itineraries.add({
      'destination': titleController.text,
      'people': '0', // Mocked for now
      'amount': 'INR ${amountController.text}',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    });
    titleController.clear();
    amountController.clear();
    startDate = null;
    endDate = null;
    update();
  }

  @override
  void onClose() {
    titleController.dispose();
    amountController.dispose();
    usernameController.dispose();
    super.onClose();
  }
}