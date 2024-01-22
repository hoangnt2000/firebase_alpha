// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ThemeDataExtension on ThemeData {
  Color get textColor => Get.isDarkMode ? Colors.white : Colors.black;
}
