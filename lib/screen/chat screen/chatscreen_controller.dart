import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';

class ChatScreenController extends GetxController {
  // Text controller for message input
  final TextEditingController messageController = TextEditingController();

  // List of messages
  RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;

  // Image picker
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    // Initialize with mock messages
    messages.assignAll([
      {
        'sender': 'Marry Helena',
        'avatar': ImageAssets.avatar,
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        'timestamp': '12:03 pm',
        'seen': true,
        'isCurrentUser': false, // Other user (left)
      },
      {
        'sender': 'Henry Melna',
        'avatar': ImageAssets.avatar,
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'timestamp': '12:04 pm',
        'seen': true,
        'isCurrentUser': false, // Other user (left)
      },
      {
        'sender': 'Maina Keni',
        'avatar': ImageAssets.avatar,
        'message': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'timestamp': '12:05 pm',
        'seen': false,
        'isCurrentUser': true, // Current user (right)
      },
    ]);
  }

  // Send message
  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      messages.add({
        'sender': 'You',
        'avatar': ImageAssets.avatar,
        'message': messageController.text.trim(),
        'timestamp': '12:06 pm',
        'seen': false,
        'isCurrentUser': true, // Current user (right)
      });
      messageController.clear();
    }
  }

  // Open image picker
  void openImagePicker() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      messages.add({
        'sender': 'You',
        'avatar': ImageAssets.avatar,
        'message': 'Image sent',
        'timestamp': '12:06 pm',
        'seen': false,
        'isCurrentUser': true, // Current user (right)
      });
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}