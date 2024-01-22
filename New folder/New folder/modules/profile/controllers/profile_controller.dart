import 'package:a5_location_sharing/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void deleteUser() async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        await user.delete();
        print('User deleted successfully.');
        Get.toNamed(Routes.LOGIN);
      } else {
        print('No user signed in.');
      }
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
