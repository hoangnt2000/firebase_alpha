import 'package:get/get.dart';

import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme =
      ThemeData.dark().copyWith(brightness: Brightness.dark);

  static final ThemeData lightTheme =
      ThemeData.light().copyWith(brightness: Brightness.light);

  static bool isDarkMode() {
    return Get.isDarkMode;
  }
}
