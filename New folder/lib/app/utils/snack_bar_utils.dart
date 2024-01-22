import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtils {
  static void showBaseSnackBar(
    String title,
    String message,
  ) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }
}
