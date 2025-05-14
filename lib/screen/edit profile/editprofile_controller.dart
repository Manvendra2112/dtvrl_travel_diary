import 'package:dtvrl_travel_diary/screen/Delete%20profile%20success%20screen/deleteprofilesuccess_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Update Profile success screen/updateprofilesuccess_screen.dart';

class EditProfileScreenController extends GetxController {
  TextEditingController emailTextCon = TextEditingController();
  TextEditingController dobTextCon = TextEditingController();
  TextEditingController phoneTextCon = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode dobFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();

  String selectedGender = "Female"; // Default gender
  String selectedAccountType = "Public"; // Default account type

  @override
  void onInit() {
    super.onInit();
    emailTextCon.text = "bhanu.Singh@gmail.com";
    dobTextCon.text = "22/08/1999";
    phoneTextCon.text = "91 + 97786648";
  }

  void selectGender(String gender) {
    selectedGender = gender;
    update();
  }

  void selectAccountType(String type) {
    selectedAccountType = type;
    update();
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1999, 8, 22),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dobTextCon.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      update();
    }
  }
  void updateProfile() {
    Get.off(() => UpdateProfileSuccessScreen());
  }

  void deleteAccount() {
    Get.off(() => DeleteProfileSuccessScreen());
  }

  @override
  void onClose() {
    emailTextCon.dispose();
    dobTextCon.dispose();
    phoneTextCon.dispose();
    emailFocus.dispose();
    dobFocus.dispose();
    phoneFocus.dispose();
    super.onClose();
  }
}