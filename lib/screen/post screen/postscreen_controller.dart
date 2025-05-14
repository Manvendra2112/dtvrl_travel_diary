import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import 'post_screen.dart';

class PostScreenController extends GetxController {
  // Flag to ensure dialog is shown only once
  bool hasShownDialog = false;

  // Mocked gallery images (replace with actual gallery access later)
  List<String> galleryImages = [
    ImageAssets.footprint,
    ImageAssets.google,
    ImageAssets.footprint,
    ImageAssets.google,
    ImageAssets.footprint,
    ImageAssets.google,
    ImageAssets.footprint,
    ImageAssets.google,
    ImageAssets.footprint,
    ImageAssets.google,
  ];

  // Selected images for the post
  List<String> selectedImages = [];

  @override
  void onInit() {
    super.onInit();
    hasShownDialog = false;
  }

  // Show bottom sheet for creating a post
  void showPostBottomSheet(BuildContext context) {
    double constrainedWidth = MediaQuery.of(context).size.width;
    double constrainedHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return GetBuilder<PostScreenController>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    "Create Your Post",
                    style: FTextStyle.custom(
                      fontSize: (constrainedWidth * 0.05).clamp(18, 20),
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: constrainedHeight * 0.02),
                  // Rectangular Container Button
                  GestureDetector(
                    onTap: () {
                      Get.back(); // Close the bottom sheet
                      Get.to(() => const PostScreen());
                    },
                    child: Container(
                      width: double.infinity, // Full width
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Color(0x1A3BC6C5), // #3BC6C5 with 10% opacity
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "post",
                          style: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                            fontWeight: FontWeight.w500,
                            color: AppColor.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: constrainedHeight * 0.03),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Show gallery options dialog
  void showGalleryOptions(BuildContext context) {
    hasShownDialog = true;
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Select Source"),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Get.back();
                // Mock gallery selection
                print("Gallery selected");
              },
              child: Text("Gallery"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Get.back();
                // Mock photos selection
                print("Photos selected");
              },
              child: Text("Photos"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Get.back();
                // Mock camera selection
                print("Camera selected");
              },
              child: Text("Camera"),
            ),
          ],
        );
      },
    );
  }

  // Toggle image selection for multiple images
  void toggleImageSelection(String imagePath) {
    if (selectedImages.contains(imagePath)) {
      selectedImages.remove(imagePath);
    } else {
      selectedImages.add(imagePath);
    }
    update();
  }
}