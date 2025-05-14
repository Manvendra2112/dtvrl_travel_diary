import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';
import '../bottomnavbar/bottomnavbar_controller.dart';
import '../bottomnavbar/bottomnavbar_screen.dart';
import 'mapscreen_controller.dart';


class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    double constrainedWidth = MediaQuery.of(context).size.width;
    double constrainedHeight = MediaQuery.of(context).size.height;

    return GetBuilder<MapScreenController>(
      init: MapScreenController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  ImageAssets.googlemap,
                  fit: BoxFit.cover,
                ),
              ),
              // Foreground UI
              Column(
                children: [
                  SizedBox(height: constrainedHeight * 0.08),
                  // Header Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigate to BottomNavScreen with index 0 (HomeScreen)
                            Get.off(() => const BottomNavScreen(), arguments: 0);
                            Get.find<BottomNavController>().changeTab(0);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColor.black,
                            size: (constrainedWidth * 0.07).clamp(24, 30),
                          ),
                        ),
                        SizedBox(width: constrainedWidth * 0.03),
                        Text(
                          "Mark your footprint",
                          style: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.05).clamp(22, 24),
                            fontWeight: FontWeight.w500,
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constrainedHeight * 0.03),
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
                      fillColors: AppColor.textFieldFillnew,
                      textInputType: TextInputType.text,
                      hintText: "Search Places...",
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
                        controller.searchQuery = value;
                        controller.filterPlaces();
                      },
                    ),
                  ),
                  SizedBox(height: constrainedHeight * 0.05),
                  // Centered Image
                  Center(
                    child: Image.asset(
                      ImageAssets.footprint,
                      width: (constrainedWidth * 0.3).clamp(100, 150),
                      height: (constrainedWidth * 0.3).clamp(100, 150),
                    ),
                  ),
                  const Spacer(),
                  // Bottom Container with Button
                  Container(
                    color: AppColor.white,
                    padding: EdgeInsets.symmetric(vertical: constrainedHeight * 0.03),
                    child: Center(
                      child: CustomWidget.elevatedCustomButton(
                        context,
                        "Tap to Create My Footprint",
                            () {
                          controller.showFootprintBottomSheet(context);
                        },
                        width: (constrainedWidth * 0.8).clamp(200, 400),
                        height: (constrainedHeight * 0.058).clamp(40, 50),
                        bgColor: AppColor.primary,
                        textColor: Colors.white,
                        borderColor: AppColor.primary,
                        borderRadius: 10,
                        fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}