import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RateReviewScreenController extends GetxController {
  // Text controller for review
  final TextEditingController reviewController = TextEditingController();

  // Ratings
  int locationRating = 0;
  int overallRating = 0;

  // Update UI when ratings change
  void setLocationRating(int rating) {
    locationRating = rating;
    update();
  }

  void setOverallRating(int rating) {
    overallRating = rating;
    update();
  }

  // Submit review (mock functionality)
  void submitReview() {
    if (locationRating == 0 || overallRating == 0 || reviewController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please provide both ratings and a review.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Mock save functionality
    print("Review submitted: Location Rating: $locationRating, Overall Rating: $overallRating, Review: ${reviewController.text}");
  }

  @override
  void onClose() {
    reviewController.dispose();
    super.onClose();
  }
}