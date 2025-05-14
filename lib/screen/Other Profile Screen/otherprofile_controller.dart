import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherProfileScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  // User data passed via constructor
  final String username;
  final String avatar;
  final int followers;

  // Other user data (still hardcoded as they aren't passed yet)
  String email = "DaredevilXXXXX";
  int following = 1000;
  int travelDays = 655;
  int itinerariesSubmitted = 10;
  int reviewsSubmitted = 10;
  String motivation = "Still Figuring Out";

  OtherProfileScreenController({
    required this.username,
    required this.avatar,
    required this.followers,
  });

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  void switchAccount() {
    Get.snackbar("Info", "Switch Account functionality not implemented yet");
  }

  void editProfileImage() {
    Get.snackbar("Info", "Edit Profile Image functionality not implemented yet");
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}