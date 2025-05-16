import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';

class ReviewScreenController extends GetxController {
  // Text controller for search
  final TextEditingController searchTextCon = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  // Search query
  RxString searchQuery = ''.obs;

  // List of reviews
  RxList<Map<String, dynamic>> reviews = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredReviews = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize mock reviews
    reviews.assignAll([
      {
        'username': 'Manvendra Singh',
        'avatar': ImageAssets.avatar,
        'posted': '4 days Ago',
        'review': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        'likes': '244',
        'comments': '123',
        'ticks': '344',
      },
      {
        'username': 'Sarah Johnson',
        'avatar': ImageAssets.avatar,
        'posted': '2 days Ago',
        'review': 'Amazing trip! The food was fantastic, and the scenery was breathtaking.',
        'likes': '150',
        'comments': '89',
        'ticks': '200',
      },
      {
        'username': 'Amit Patel',
        'avatar': ImageAssets.avatar,
        'posted': '1 week Ago',
        'review': 'Great experience, but the weather could have been better.',
        'likes': '300',
        'comments': '50',
        'ticks': '180',
      },
    ]);
    filteredReviews.assignAll(reviews);
  }

  // Filter reviews based on search query
  void filterReviews() {
    if (searchQuery.value.isEmpty) {
      filteredReviews.assignAll(reviews);
    } else {
      filteredReviews.assignAll(
        reviews.where((review) =>
        review['username'].toString().toLowerCase().contains(searchQuery.value.toLowerCase()) ||
            review['review'].toString().toLowerCase().contains(searchQuery.value.toLowerCase())).toList(),
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