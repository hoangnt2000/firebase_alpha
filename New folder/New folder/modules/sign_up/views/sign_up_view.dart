import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../ui/ui.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
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
                        buildNameTextField(),
                        buildEmailTextField(),
                        buildPasswordTextField(),
                        buildConfirmPasswordTextField(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 10),
                        buildButtonLogin(),
                        const SizedBox(height: 10),
                        buildFooterSignUp(),
                        const SizedBox(height: 12),
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

  Widget buildButtonLogin() {
    return Align(
      alignment: Alignment.centerRight,
      child: ButtonWidget(
        backgroundColor: UI.color.secondary,
        width: Get.width * 0.3,
        title: LocaleKeys.sign_up.tr,
        onTap: () async {
          User? user = await controller.signUpWithEmailAndPassword(
              controller.emailController.text,
              controller.passwordController.text);
          if (user != null) {
            Get.toNamed(Routes.LOGIN);
          }
        },
      ),
    );
  }

  Widget buildNameTextField() {
    return TextFieldWidget(
      controller: controller.usernameController,
      hintText: LocaleKeys.name.tr,
      isPasswordField: false,
      inputType: TextInputType.name,
      icon: const Icon(FontAwesomeIcons.user),
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

  Widget buildPasswordTextField() {
    return TextFieldWidget(
      controller: controller.passwordController,
      hintText: LocaleKeys.password.tr,
      isPasswordField: true,
      icon: const Icon(Icons.key_sharp),
    );
  }

  Widget buildConfirmPasswordTextField() {
    return TextFieldWidget(
      controller: controller.confirmPasswordController,
      hintText: LocaleKeys.confirm_password.tr,
      isPasswordField: true,
      icon: const Icon(Icons.key_sharp),
      validator: (value) {
        if (value != controller.passwordController) {
          return "Password not match";
        }
        return null;
      },
    );
  }

  Widget buildFooterSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.ask_login.tr),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.LOGIN);
          },
          child: Text(
            LocaleKeys.login.tr,
            style: TextStyle(
              color: UI.color.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
