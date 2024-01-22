import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();



  @override
  void onClose() {
    super.onClose();
  }

  Future<User?> changePassword(String password) async {
    return null;
  }
}
