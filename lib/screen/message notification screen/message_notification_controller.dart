import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';

class MessageScreenController extends GetxController {
  // Search text controller
  final TextEditingController searchTextCon = TextEditingController();

  // Search focus node
  final FocusNode searchFocus = FocusNode();

  // Search query
  var searchQuery = ''.obs;

  // Mock user data
  final List<Map<String, dynamic>> users = [
    {
      'username': 'manvendra singh',
      'avatar': ImageAssets.avatar,
      'status': 'Fine',
      'bio': 'Cool',
      'unreadCount': 2,
      'timestamp': 'Today, 12:25',
    },
    {
      'username': 'jane_doe',
      'avatar': ImageAssets.avatar,
      'status': 'Awesome',
      'bio': 'OK!',
      'unreadCount': 3,
      'timestamp': 'Yesterday, 15:30',
    },
    {
      'username': 'travel_guru',
      'avatar': ImageAssets.avatar,
      'status': 'OK!',
      'bio': 'Awesome',
      'unreadCount': 1,
      'timestamp': 'Today, 09:45',
    },
    {
      'username': 'adventure_seeker',
      'avatar': ImageAssets.avatar,
      'status': 'Great',
      'bio': 'Chillin',
      'unreadCount': 0,
      'timestamp': '2 days ago',
    },
    {
      'username': 'wanderlust',
      'avatar': ImageAssets.avatar,
      'status': 'Cool',
      'bio': 'Epic',
      'unreadCount': 4,
      'timestamp': 'Today, 08:20',
    },
  ];

  // Filtered users list
  RxList<Map<String, dynamic>> filteredUsers = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize filteredUsers with all users
    filteredUsers.assignAll(users);
    // Listen to searchTextCon changes (optional, as onChanged handles updates)
    searchTextCon.addListener(() {
      searchQuery.value = searchTextCon.text;
      filterUsers();
    });
  }

  // Filter users based on search query
  void filterUsers() {
    if (searchQuery.value.isEmpty) {
      filteredUsers.assignAll(users);
    } else {
      filteredUsers.assignAll(
        users.where((user) => user['username']
            .toString()
            .toLowerCase()
            .contains(searchQuery.value.toLowerCase())),
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