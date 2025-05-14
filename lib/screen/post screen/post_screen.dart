import 'package:dtvrl_travel_diary/screen/post%20screen/postscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';

import '../Post Creation screen Second/postcrestion_screen.dart';

// Placeholder for PostCreationScreen
class PostCreationScreen extends StatelessWidget {
  final List<String> selectedImages;

  const PostCreationScreen({super.key, required this.selectedImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Post Creation Screen\nSelected Images: ${selectedImages.length}"),
      ),
    );
  }
}

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double constrainedWidth = width;
    double constrainedHeight = height;

    return GetBuilder<PostScreenController>(
      init: PostScreenController(),
      builder: (controller) {
        // Show gallery options dialog when screen opens
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!controller.hasShownDialog) {
            controller.showGalleryOptions(context);
          }
        });

        return Scaffold(
          backgroundColor: Colors.black, // Instagram-like background
          body: SafeArea(
            child: Column(
              children: [
                // Top Row
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: (constrainedWidth * 0.07).clamp(24, 30),
                            ),
                          ),
                          SizedBox(width: constrainedWidth * 0.03),
                          Text(
                            "Recent",
                            style: FTextStyle.custom(
                              fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: constrainedWidth * 0.02),
                          GestureDetector(
                            onTap: () => controller.showGalleryOptions(context),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: (constrainedWidth * 0.07).clamp(24, 30),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: controller.selectedImages.isNotEmpty
                            ? () {
                          Get.to(() => PostCreationScreenSecond(
                            //selectedImages: controller.selectedImages,
                          ));
                        }
                            : null,
                        child: Text(
                          "Next",
                          style: FTextStyle.custom(
                            fontSize: (constrainedWidth * 0.04).clamp(14, 16),
                            fontWeight: FontWeight.w600,
                            color: controller.selectedImages.isNotEmpty
                                ? AppColor.primary
                                : AppColor.primary.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Preview Area
                Container(
                  width: constrainedWidth,
                  height: constrainedWidth, // Square preview like Instagram
                  color: Colors.grey[900],
                  child: controller.selectedImages.isNotEmpty
                      ? PageView.builder(
                    itemCount: controller.selectedImages.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        controller.selectedImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  )
                      : Center(
                    child: Text(
                      "Select an image",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // Gallery Grid
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(2),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: controller.galleryImages.length,
                    itemBuilder: (context, index) {
                      bool isSelected = controller.selectedImages
                          .contains(controller.galleryImages[index]);
                      int selectionOrder = controller.selectedImages
                          .indexOf(controller.galleryImages[index]);
                      return GestureDetector(
                        onTap: () => controller.toggleImageSelection(
                            controller.galleryImages[index]),
                        child: Stack(
                          children: [
                            Image.asset(
                              controller.galleryImages[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            if (isSelected)
                              Positioned(
                                top: 5,
                                right: 5,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${selectionOrder + 1}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}