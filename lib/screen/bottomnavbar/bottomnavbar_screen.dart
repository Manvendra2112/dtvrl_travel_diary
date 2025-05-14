import 'package:dtvrl_travel_diary/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../support/app_theme.dart';
import '../../support/imageassets.dart';
import '../ReviewScreen/review_screen.dart';
import '../itinerary screen/itinerary_screen.dart';
import '../map screen/map_screen.dart';
import '../post screen/post_screen.dart';
import '../post screen/postscreen_controller.dart';
import 'bottomnavbar_controller.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());
    final double width = MediaQuery.of(context).size.width;

    return GetBuilder<BottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: const [
              HomeScreen(),
              ReviewScreen(),
              PostScreen(),
              MapScreen(),
              ItineraryScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (index) {
              if (index == 2) {
                // Show bottom sheet for Post tab
                Get.put(PostScreenController()).showPostBottomSheet(context);
              } else if (index == 3) {
                // Navigate to MapScreen without bottom navigation bar
                Get.to(() => const MapScreen());
              } else {
                controller.changeTab(index);
              }
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.textfieldtextcolor,
            selectedLabelStyle: TextStyle(
              fontSize: width * 0.035,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: width * 0.035,
              fontWeight: FontWeight.w400,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  controller.currentIndex == 0
                      ? ImageAssets.homeselected
                      : ImageAssets.homeunselected,
                  width: width * 0.06,
                  height: width * 0.06,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  controller.currentIndex == 1
                      ? ImageAssets.reviewselected
                      : ImageAssets.reviewunselected,
                  width: width * 0.06,
                  height: width * 0.06,
                ),
                label: 'Reviews',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  controller.currentIndex == 2
                      ? ImageAssets.postselected
                      : ImageAssets.postunselected,
                  width: width * 0.06,
                  height: width * 0.06,
                ),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  controller.currentIndex == 3
                      ? ImageAssets.mapselected
                      : ImageAssets.mapunselected,
                  width: width * 0.06,
                  height: width * 0.06,
                ),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  controller.currentIndex == 4
                      ? ImageAssets.itineraryselected
                      : ImageAssets.itineraryunselected,
                  width: width * 0.06,
                  height: width * 0.06,
                ),
                label: 'itinerary',
              ),
            ],
          ),
        );
      },
    );
  }
}