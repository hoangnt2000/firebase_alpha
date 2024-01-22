import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    askForPermissions();
    Get.offAllNamed(AppPages.AFTER_SPLASH);
    super.onReady();
  }

  Future askForPermissions() async {
    await [
      Permission.notification,
      // Permission.location,
      // Permission.locationAlways,
      // Permission.locationWhenInUse,
    ].request();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
