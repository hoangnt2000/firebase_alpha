import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../ui/ui.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            buildHeader(),
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
                      buildTitle(),
                      SvgPicture.asset(UI.icon.icLocation),
                    ],
                  ),
                  buildIcon(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        buildTitleChangePass(),
                        const SizedBox(height: 10),
                        buildPasswordTextField(),
                        const SizedBox(height: 10),
                        buildConfirmPassTextFiled(),
                        const SizedBox(height: 10),
                        buildButtonSubmit(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            buildFooter()
          ],
        ),
      ),
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

  Widget buildConfirmPassTextFiled() {
    return TextFieldWidget(
      controller: controller.confirmPasswordController,
      hintText: LocaleKeys.confirm_password.tr,
      isPasswordField: true,
      icon: const Icon(Icons.key_sharp),
    );
  }

  Widget buildButtonSubmit() {
    return Align(
      alignment: Alignment.centerRight,
      child: ButtonWidget(
        backgroundColor: UI.color.secondary,
        width: Get.width * 0.3,
        title: LocaleKeys.submit.tr,
        onTap: () async {
          controller.changePassword(controller.passwordController.text);
        },
      ),
    );
  }

  Widget buildTitleChangePass() {
    return Text(
      LocaleKeys.new_password.tr,
      style: UI.textStyle.H3.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      LocaleKeys.app_name.tr,
      style: UI.textStyle.H2.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildFooter() {
    return Positioned(
      bottom: 5,
      child: SvgPicture.asset(
        UI.icon.icFooterLogin,
        height: Get.height * 0.25,
      ),
    );
  }

  Widget buildHeader() {
    return Positioned(
      right: 0,
      top: 0,
      child: SvgPicture.asset(
        UI.icon.icHeaderLogin,
        width: Get.width * 0.7,
        color: UI.color.secondary,
      ),
    );
  }

  Widget buildIcon() {
    return Expanded(
      flex: 1,
      child: SvgPicture.asset(
        UI.icon.icMap,
      ),
    );
  }
}
