import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../edit profile/editprofile.dart';

class ProfileScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  // User data
  String username = "manvendra@123";
  String email = "smanvendra292@gmail.com";
  int followers = 500;
  int following = 1000;
  int travelDays = 655;
  int itinerariesSubmitted = 10;
  int reviewsSubmitted = 10;
  String motivation = "Still Figuring Out";

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  void switchAccount() {
    // Logic for switching account
    Get.snackbar("Info", "Switch Account functionality not implemented yet");
  }

  void editProfileImage() {
    Get.to(() => EditProfileScreen());
  }


  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}