import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCreationScreenSecondController extends GetxController {
  TextEditingController captionTextCon = TextEditingController();
  FocusNode captionFocus = FocusNode();

  @override
  void onInit() {
    super.onInit();
    captionTextCon.text = "";
  }

  void sharePost() {
    Get.snackbar("Success", "Post shared successfully");
    Get.back();
  }

  @override
  void onClose() {
    captionTextCon.dispose();
    captionFocus.dispose();
    super.onClose();
  }
}