import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/snack_bar_utils.dart';
import '../../../widgets/button/button_widget.dart';
import '../../../widgets/textfield/text_field_widget.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController otpVerifyController = TextEditingController();
    final EmailOTP emailOTP = EmailOTP();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResetPasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter Email to reset Password"),
            TextFieldWidget(
              controller: emailController,
              hintText: "Email",
              isPasswordField: false,
              inputType: TextInputType.emailAddress,
            ),
            ButtonWidget(
              title: "Send To OTP",
              onTap: () async {
                // controller.resetPassword(emailController.text.trim());
                emailOTP.setConfig(
                  appEmail: "nguyentuanhoang2013@gmail.com",
                  appName: "Location Sharing",
                  userEmail: emailController.text,
                  otpLength: 6,
                  otpType: OTPType.digitsOnly,
                );
                if (await emailOTP.sendOTP() == true) {
                  SnackBarUtils.showBaseSnackBar(
                      "Reset Password", "OTP has been sent");
                } else {
                  SnackBarUtils.showBaseSnackBar(
                      "Reset Password", "OTP send failed");
                }
              },
            ),
            TextFieldWidget(
              controller: otpVerifyController,
              hintText: "Enter OTP",
              isPasswordField: false,
              inputType: TextInputType.number,
            ),
            ButtonWidget(
              title: "Verify",
              onTap: () async {
                if (await emailOTP.verifyOTP(otp: otpVerifyController.text) ==
                    true) {
                  SnackBarUtils.showBaseSnackBar(
                      "Reset Password", "OTP is verified");
                  Get.toNamed(Routes.LOGIN);
                } else {
                  SnackBarUtils.showBaseSnackBar(
                      "Reset Password", "Invalid OTP");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
