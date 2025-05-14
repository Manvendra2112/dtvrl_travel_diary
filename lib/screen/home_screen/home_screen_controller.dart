import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';

class HomeScreenController extends GetxController {
  // Search text controller
  final TextEditingController searchTextCon = TextEditingController();
  var profileImagePath = ''.obs;

  // Search focus node
  final FocusNode searchFocus = FocusNode();

  // Message and notification counts
  var messageCount = 1.obs;
  var notificationCount = 1.obs;

  // Mock user data for search
  final List<Map<String, dynamic>> users = [
    {
      'username': 'manvendra@singh',
      'avatar': ImageAssets.avatar,
      'followers': 30,
    },
    {
      'username': 'jane_doe',
      'avatar': ImageAssets.avatar,
      'followers': 15,
    },
    {
      'username': 'travel_guru',
      'avatar': ImageAssets.avatar,
      'followers': 50,
    },
    {
      'username': 'adventure_seeker',
      'avatar': ImageAssets.avatar,
      'followers': 25,
    },
    {
      'username': 'wanderlust',
      'avatar': ImageAssets.avatar,
      'followers': 40,
    },
  ];

  // Filtered users based on search query
  var filteredUsers = <Map<String, dynamic>>[].obs;

  // Mock post data
  final List<Map<String, dynamic>> posts = [
    {
      'avatar': ImageAssets.avatar,
      'username': 'manvendra@singh',
      'image': ImageAssets.post1,
      'likes': 244,
      'comments': 245,
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      'timestamp': '4 days ago',
    },
    {
      'avatar': ImageAssets.avatar,
      'username': 'jane_doe',
      'image': ImageAssets.post1,
      'likes': 152,
      'comments': 89,
      'description': 'Exploring new horizons!',
      'timestamp': '2 days ago',
    },
    {
      'avatar': ImageAssets.avatar,
      'username': 'travel_guru',
      'image': ImageAssets.post1,
      'likes': 387,
      'comments': 123,
      'description': 'Chasing sunsets and dreams.',
      'timestamp': '1 day ago',
    },
    {
      'avatar': ImageAssets.avatar,
      'username': 'adventure_seeker',
      'image': ImageAssets.post1,
      'likes': 99,
      'comments': 45,
      'description': 'Life is an adventure!',
      'timestamp': '5 days ago',
    },
    {
      'avatar': ImageAssets.avatar,
      'username': 'wanderlust',
      'image': ImageAssets.post1,
      'likes': 321,
      'comments': 200,
      'description': 'Finding beauty in every corner.',
      'timestamp': '3 days ago',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    filteredUsers.value = [];
    // Listen to search text changes
    searchTextCon.addListener(() {
      filterUsers();
    });
  }

  void filterUsers() {
    String query = searchTextCon.text.toLowerCase();
    if (query.isEmpty) {
      filteredUsers.value = [];
    } else {
      filteredUsers.value = users
          .where((user) => user['username'].toString().toLowerCase().contains(query))
          .toList();
    }
  }

  // Pick profile image
  Future<void> pickProfileImage() async {
    try {
      final File? image = await CustomWidget.pickImageFromGallery();
      if (image != null) {
        profileImagePath.value = image.path;
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pick image: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    searchTextCon.dispose();
    searchFocus.dispose();
    super.onClose();
  }
}