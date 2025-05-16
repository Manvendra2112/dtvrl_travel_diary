import 'package:country_code_picker/country_code_picker.dart';
import 'package:dtvrl_travel_diary/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';
import 'signup_screen_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return GetBuilder<SignUpScreenController>(
      init: Get.put(SignUpScreenController()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.08), // Top spacing
                  // App logo
                  Image.asset(
                    ImageAssets.appicon,
                    height: height * 0.15,
                    width: width * 0.3,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: height * 0.02),
                  // Title
                  Text(
                    "Create an Account",
                    style: FTextStyle.customPreahvihear(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  // Description
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                    maxLines: 1,
                    style: FTextStyle.customPreahvihear(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textfieldtextcolor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.03),
                  // Username
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Username*",
                      style: FTextStyle.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomWidget.textInputFiled(
                    controller.usernameTextCon,
                    focusNode: controller.usernameFocus,
                    textAlign: TextAlign.left,
                    topPadding: 0,
                    leftPadding: 0,
                    rightPadding: 0,
                    bottomPadding: 10,
                    borderRadius: 50,
                    blurRadius: 10,
                    fillColorFiled: true,
                    fillColors: AppColor.textFieldFill,
                    textInputType: TextInputType.text,
                    hintText: "mani@123",
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Email Address
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Address*",
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
                    hintText: "mani123@gmail.com",
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Phone Number
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phone Number*",
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
                    hintText: "7007768809",
                    prefixIconWidget: CountryCodePicker(
                      onChanged: (countryCode) {
                        controller.updateCountryCode(countryCode.dialCode!);
                      },
                      initialSelection: 'IN', // Default to India
                      favorite: ['+91', 'IN'], // Optional: Add favorites
                      showCountryOnly: false,
                      //showOnlyCountry: false,
                      showFlag: true,
                      showFlagDialog: true,
                      textStyle: FTextStyle.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Create Password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Create Password",
                      style: FTextStyle.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomWidget.textInputFiled(
                    controller.passwordTextCon,
                    focusNode: controller.passwordFocus,
                    textAlign: TextAlign.left,
                    topPadding: 0,
                    leftPadding: 0,
                    rightPadding: 0,
                    bottomPadding: 10,
                    blurRadius: 10,
                    borderRadius: 10,
                    fillColorFiled: true,
                    fillColors: AppColor.textFieldFill,
                    textInputType: TextInputType.visiblePassword,
                    passwordHide: !controller.isPasswordVisible,
                    maxLine: 1,
                    hintText: "mani1234@",
                    suffixIconWidget: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Confirm Password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Confirm Password",
                      style: FTextStyle.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomWidget.textInputFiled(
                    controller.confirmPasswordTextCon,
                    focusNode: controller.confirmPasswordFocus,
                    textAlign: TextAlign.left,
                    topPadding: 0,
                    leftPadding: 0,
                    rightPadding: 0,
                    bottomPadding: 10,
                    blurRadius: 10,
                    borderRadius: 10,
                    fillColorFiled: true,
                    fillColors: AppColor.textFieldFill,
                    textInputType: TextInputType.visiblePassword,
                    passwordHide: !controller.isConfirmPasswordVisible,
                    maxLine: 1,
                    hintText: "........",
                    suffixIconWidget: IconButton(
                      icon: Icon(
                        controller.isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.toggleConfirmPasswordVisibility,
                    ),
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Referral Username
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Referral Username",
                      style: FTextStyle.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomWidget.textInputFiled(
                    controller.referralUsernameTextCon,
                    focusNode: controller.referralUsernameFocus,
                    textAlign: TextAlign.left,
                    topPadding: 0,
                    leftPadding: 0,
                    rightPadding: 0,
                    bottomPadding: 10,
                    blurRadius: 10,
                    borderRadius: 10,
                    fillColorFiled: true,
                    fillColors: AppColor.textFieldFill,
                    textInputType: TextInputType.text,
                    hintText: "john@123",
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  // Checkbox
                  Row(
                    children: [
                      GestureDetector(
                        onTap: controller.toggleTermsAgreed,
                        child: Container(
                          width: width * 0.06,
                          height: width * 0.06,
                          decoration: BoxDecoration(
                            color: controller.isTermsAgreed
                                ? AppColor.primary
                                : Colors.transparent,
                            border: Border.all(color: AppColor.border),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: controller.isTermsAgreed
                              ? Icon(
                            Icons.check,
                            color: AppColor.white,
                            size: width * 0.04,
                          )
                              : null,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        " Agree to Terms & Conditions",
                        style: FTextStyle.custom(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  // Create Account Button
                  CustomWidget.elevatedCustomButton(
                    context,
                    "Create Account",
                        () => controller.submitSignUp(context),
                    width: width * 0.9,
                    bgColor: AppColor.primary,
                    textColor: AppColor.white,
                    borderColor: AppColor.primary,
                    borderRadius: 10,
                    fontSize: 16,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: height * 0.025),
                  // Divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColor.black,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                        child: Text(
                          "Or Continue With",
                          style: FTextStyle.custom(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textfieldtextcolor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColor.black,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.025),
                  // Google Sign Up Button
                  CustomWidget.socialButton(
                    context,
                    text: "Sign up With Google",
                    imagePath: ImageAssets.google,
                    onPressed: controller.signUpWithGoogle,
                    borderColor: AppColor.primary,
                    borderWidth: 1,
                    backgroundColor: AppColor.white,
                    width: width * 0.9,
                    height: height * 0.06,
                    textStyle: FTextStyle.custom(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: FTextStyle.custom(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Text(
                          ' Login ',
                          style: FTextStyle.custom(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                    ],
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