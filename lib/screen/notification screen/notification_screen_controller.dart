import 'package:get/get.dart';

class NotificationScreenController extends GetxController {
  // Mock notification data
  final List<Map<String, String>> notifications = [
    {
      'message': 'Lorem ipsum dolor sit amet, consectetur.',
      'timestamp': '23 March, 2025',
    },
    {
      'message': 'New comment on your post!',
      'timestamp': '22 March, 2025',
    },
    {
      'message': 'Your itinerary has been updated.',
      'timestamp': '21 March, 2025',
    },
    {
      'message': 'Follow request from travel_guru.',
      'timestamp': '20 March, 2025',
    },
    {
      'message': 'Reminder: Check your travel plans.',
      'timestamp': '19 March, 2025',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    // Initialize any additional setup if needed
  }
}