import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/button/button_widget.dart';
import '../../../widgets/textfield/text_field_widget.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              controller: usernameController,
              hintText: "Name",
              isPasswordField: false,
            ),
            TextFieldWidget(
              controller: emailController,
              hintText: "Email",
              isPasswordField: false,
              inputType: TextInputType.emailAddress,
            ),
            TextFieldWidget(
              controller: passwordController,
              hintText: "Password",
              isPasswordField: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              title: "Sign Up",
              onTap: () async {
                User? user = await controller.signUpWithEmailAndPassword(
                    emailController.text, passwordController.text);
                if (user != null) {
                  Get.toNamed(Routes.LOGIN);
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
