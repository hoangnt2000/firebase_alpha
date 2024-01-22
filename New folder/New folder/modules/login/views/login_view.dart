import 'package:a5_location_sharing/generated/locales.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../ui/ui.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: SvgPicture.asset(
                UI.icon.icHeaderLogin,
                width: Get.width * 0.7,
                color: UI.color.secondary,
              ),
            ),
            SizedBox(
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.app_name.tr,
                        style: UI.textStyle.H2.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SvgPicture.asset(UI.icon.icLocation),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: SvgPicture.asset(
                      UI.icon.icMap,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        buildEmailTextField(),
                        buildPasswordTextField(),
                        const SizedBox(height: 10),
                        buildForgotPassword(),
                        const SizedBox(height: 10),
                        buildButtonLogin(),
                        SizedBox(height: Get.height * 0.05),
                        const Divider(height: 1),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildMethodLogin(),
                        const SizedBox(height: 10),
                        buildRegisterWidget(),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 5,
              child: SvgPicture.asset(
                UI.icon.icFooterLogin,
                height: Get.height * 0.25,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMethodLogin() {
    return SizedBox(
      width: Get.width * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          (GetPlatform.isAndroid)
              ? buildAndroidLoginWidget()
              : buildIOSLoginWidget()
        ],
      ),
    );
  }

  Widget buildButtonLogin() {
    return Align(
      alignment: Alignment.centerRight,
      child: ButtonWidget(
        backgroundColor: UI.color.secondary,
        width: Get.width * 0.3,
        title: LocaleKeys.login.tr,
        onTap: () async {
          User? user = await controller.signInWithEmailAndPassword(
            controller.emailController.text,
            controller.passwordController.text,
          );
          if (user != null) {
            Get.toNamed(Routes.HOME);
          }
        },
      ),
    );
  }

  Widget buildForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.RESET_PASSWORD);
          },
          child: Text(
            LocaleKeys.forgot_password.tr,
            style: TextStyle(
              color: UI.color.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget buildPasswordTextField() {
    return TextFieldWidget(
      controller: controller.passwordController,
      hintText: LocaleKeys.password.tr,
      isPasswordField: true,
      icon: const Icon(Icons.key_sharp),
    );
  }

  Widget buildEmailTextField() {
    return TextFieldWidget(
      controller: controller.emailController,
      hintText: LocaleKeys.email.tr,
      isPasswordField: false,
      inputType: TextInputType.emailAddress,
      icon: const Icon(FontAwesomeIcons.envelope),
    );
  }

  Widget buildRegisterWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.ask_signup.tr),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.SIGN_UP);
          },
          child: Text(
            LocaleKeys.sign_up.tr,
            style: TextStyle(
              color: UI.color.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAndroidLoginWidget() {
    return GestureDetector(
      onTap: () {
        controller.signInWithGoogle();
      },
      child: SvgPicture.asset(
        UI.icon.icGoogle,
        height: 50,
        width: 50,
      ),
    );
  }

  Widget buildIOSLoginWidget() {
    return SizedBox(
      width: Get.width * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              UI.icon.icGoogle,
              height: 50,
              width: 50,
            ),
          ),
          Text(LocaleKeys.or.tr),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              UI.icon.icApple,
              height: 50,
              width: 50,
            ),
          )
        ],
      ),
    );
  }
}
