import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import '../../constant/custom_widget.dart';
import 'editprofile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return GetBuilder<EditProfileScreenController>(
      init: Get.put(EditProfileScreenController()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: height * 0.06),
                  // Header with back and more-vert icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: AppColor.black),
                        onPressed: () => Get.back(),
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert, color: AppColor.black),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  // Edit Profile text
                  Text(
                    "Edit Profile",
                    style: FTextStyle.custom(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  // Edit Email Address
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Edit Email Address",
                      style: FTextStyle.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomWidget.textInputFiled(
                    controller.emailTextCon,
                    focusNode: controller.emailFocus,
                    textAlign: TextAlign.left,
                    topPadding: 0,
                    leftPadding: 0,
                    rightPadding: 0,
                    bottomPadding: 10,
                    blurRadius: 10,
                    borderRadius: 10,
                    fillColorFiled: true,
                    fillColors: AppColor.textFieldFill,
                    textInputType: TextInputType.emailAddress,
                    hintText: "bhanu.Singh@gmail.com",
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Edit Date of Birth
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Edit Date Of Birth",
                      style: FTextStyle.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomWidget.textInputFiled(
                    controller.dobTextCon,
                    focusNode: controller.dobFocus,
                    textAlign: TextAlign.left,
                    topPadding: 0,
                    leftPadding: 0,
                    rightPadding: 0,
                    bottomPadding: 10,
                    blurRadius: 10,
                    borderRadius: 10,
                    fillColorFiled: true,
                    fillColors: AppColor.textFieldFill,
                    textInputType: TextInputType.datetime,
                    hintText: "22/08/1999",
                    suffixIconWidget: IconButton(
                      icon: Icon(Icons.calendar_today, color: AppColor.black),
                      onPressed: () => controller.pickDate(context),
                    ),
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Gender
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Gender",
                      style: FTextStyle.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      CustomWidget.radioButtonWithLabel(
                        value: "Female",
                        groupValue: controller.selectedGender,
                        onChanged: controller.selectGender,
                        label: "Female",
                      ),
                      SizedBox(width: 20),
                      CustomWidget.radioButtonWithLabel(
                        value: "Male",
                        groupValue: controller.selectedGender,
                        onChanged: controller.selectGender,
                        label: "Male",
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  // Edit Phone Number
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Edit Phone Number",
                      style: FTextStyle.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomWidget.textInputFiled(
                    controller.phoneTextCon,
                    focusNode: controller.phoneFocus,
                    textAlign: TextAlign.left,
                    topPadding: 0,
                    leftPadding: 0,
                    rightPadding: 0,
                    bottomPadding: 10,
                    blurRadius: 10,
                    borderRadius: 10,
                    fillColorFiled: true,
                    fillColors: AppColor.textFieldFill,
                    textInputType: TextInputType.phone,
                    hintText: "91 + 97786648",
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Account visibility
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Account",
                      style: FTextStyle.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      CustomWidget.radioButtonWithLabel(
                        value: "Public",
                        groupValue: controller.selectedAccountType,
                        onChanged: controller.selectAccountType,
                        label: "Public",
                      ),
                      SizedBox(width: 20),
                      CustomWidget.radioButtonWithLabel(
                        value: "Private",
                        groupValue: controller.selectedAccountType,
                        onChanged: controller.selectAccountType,
                        label: "Private",
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  // Update Button
                  CustomWidget.elevatedCustomButton(
                    context,
                    "Update",
                    controller.updateProfile,
                    width: width,
                    bgColor: AppColor.primary,
                    textColor: AppColor.white,
                    borderColor: AppColor.primary,
                    borderRadius: 10,
                    fontSize: 16,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: height * 0.02),
                  // Delete Button
                  CustomWidget.elevatedCustomButton(
                    context,
                    "Delete Profile",
                    controller.deleteAccount,
                    width: width,
                    bgColor: AppColor.white,
                    textColor: Color(0xFFFF6F59),
                    borderColor: Color(0xFFFF6F59),
                    borderRadius: 10,
                    fontSize: 16,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: height * 0.03),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}