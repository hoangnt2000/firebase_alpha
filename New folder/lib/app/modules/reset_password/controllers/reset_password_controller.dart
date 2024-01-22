import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/snack_bar_utils.dart';

class ResetPasswordController extends GetxController {
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

  Future<void> resetPassword(String emailReset) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: emailReset);
      SnackBarUtils.showBaseSnackBar(
          "Reset Password", "Password Reset Email Sent");
      Get.offAllNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      SnackBarUtils.showBaseSnackBar("Reset Password", "User not Found");
      print(e);
    }
  }

  
}
