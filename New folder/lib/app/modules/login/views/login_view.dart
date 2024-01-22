import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/button/button_widget.dart';
import '../../../widgets/textfield/text_field_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetWidget<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.RESET_PASSWORD);
                  },
                  child: const Text(
                    "Forgot password ?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
              title: "Login",
              onTap: () async {
                User? user = await controller.signInWithEmailAndPassword(
                    emailController.text, passwordController.text);
                if (user != null) {
                  Get.toNamed(Routes.HOME);
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(height: 1),
            ButtonWidget(
              title: "Sign In With Google",
              onTap: () {
                controller.signInWithGoogle();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SIGN_UP);
                  },
                  child: const Text(
                    "Sign Up",
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
