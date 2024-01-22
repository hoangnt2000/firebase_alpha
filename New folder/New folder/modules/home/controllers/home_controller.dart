import 'package:a5_location_sharing/app/routes/app_pages.dart';
import 'package:a5_location_sharing/app/servive/location_service.dart';
import 'package:a5_location_sharing/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<bool> isMute = false.obs;
  late final Rx<SpeedUnit> speedUnit;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();

    speedUnit = Rx<SpeedUnit>(SpeedUnit.km);
  }

  void onSelectSpeed(SpeedUnit? mSpeed) {
    speedUnit.value = mSpeed ?? SpeedUnit.km;
  }

  void signOut() async {
    await firebaseAuth.signOut();
    Get.toNamed(Routes.LOGIN);
  }

  void drawer() {
    scaffoldKey.currentState!.openDrawer();
  }
}
