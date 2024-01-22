import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/snack_bar_utils.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpVerifyController = TextEditingController();
  final EmailOTP emailOTP = EmailOTP();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void sendOTP() async {
    emailOTP.setConfig(
      appEmail: "LocationSharing@gmail.com",
      appName: LocaleKeys.app_name.tr,
      userEmail: emailController.text,
      otpLength: 6,
      otpType: OTPType.digitsOnly,
    );
    if (await emailOTP.sendOTP() == true) {
      SnackBarUtils.showBaseSnackBar(
          LocaleKeys.reset_password.tr, LocaleKeys.send_otp_success.tr);
    } else {
      SnackBarUtils.showBaseSnackBar(
          LocaleKeys.reset_password.tr, LocaleKeys.send_otp_fail.tr);
    }
  }

  void verifyOTP() async {
    if (await emailOTP.verifyOTP(otp: otpVerifyController.text) == true) {
      SnackBarUtils.showBaseSnackBar(
          LocaleKeys.reset_password.tr, LocaleKeys.verify_success.tr);
      Get.toNamed(Routes.CHANGE_PASSWORD);
    } else {
      SnackBarUtils.showBaseSnackBar(
          LocaleKeys.reset_password.tr, LocaleKeys.verify_failed.tr);
    }
  }
}
