import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dtvrl_travel_diary/support/app_theme.dart';
import 'package:dtvrl_travel_diary/support/flutter_font_style.dart';
import 'package:dtvrl_travel_diary/support/imageassets.dart';
import '../../constant/custom_widget.dart';
import 'login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = CustomWidget.getWidth(context);
    double height = CustomWidget.getHeight(context);

    return GetBuilder<LoginScreenController>(
      init: Get.put(LoginScreenController()),
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
                    "Login to Your Account",
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
                    // enableBorder: true,
                    // borderColor: AppColor.border,
                    // borderWidth: 1,
                    blurRadius: 10,
                    borderRadius: 50,
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
                  // Email Address or Phone Number
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Address / Phone Number*",
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
                    // enableBorder: true,
                    // borderColor: AppColor.border,
                    // borderWidth: 1,
                    blurRadius: 10,
                    borderRadius: 50,
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
                  // Password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter Password",
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
                    // enableBorder: true,
                    // borderColor: AppColor.border,
                    // borderWidth: 1,
                    blurRadius: 10,
                    borderRadius: 50,
                    fillColorFiled: true,
                    fillColors: AppColor.textFieldFill,
                    textInputType: TextInputType.visiblePassword,
                   // obscureText: true, // Password is hidden by default
                    maxLine: 1,
                    hintText: "mani1234@",
                    hintStyle: FTextStyle.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: controller.navigateToForgotPassword,
                      child: Text(
                        'Forget Password ?',
                        style: FTextStyle.custom(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Login Button
                  CustomWidget.elevatedCustomButton(
                    context,
                    "Login",
                        () => controller.submitLogin(context),
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
                    text: "Sign in With Google",
                    imagePath: ImageAssets.google,
                    onPressed: controller.signInWithGoogle,
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
                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an Account ?',
                        style: FTextStyle.custom(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: controller.navigateToSignUp,
                        child: Text(
                          ' Signup',
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