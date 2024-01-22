import 'package:a5_location_sharing/app/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';

import '../../../routes/app_pages.dart';
import '../../../ui/ui.dart';

import '../../../widgets/text_field_widget.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

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
                    flex: 1,
                    child: SvgPicture.asset(
                      UI.icon.icMap,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(LocaleKeys.title_reset_pass.tr),
                        buildEmailTextField(),
                        const SizedBox(height: 10),
                        buildButtonContinue(),
                        const SizedBox(height: 10),
                        buildEnterOTPTextField(),
                        const SizedBox(height: 10),
                        buildButtonVerify(),
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

  Widget buildButtonVerify() {
    return Align(
      alignment: Alignment.centerRight,
      child: ButtonWidget(
        backgroundColor: UI.color.secondary,
        width: Get.width * 0.3,
        title: LocaleKeys.verify.tr,
        onTap: () {
          Get.toNamed(Routes.CHANGE_PASSWORD);
        },
        // onTap: () => controller.verifyOTP(),
      ),
    );
  }

  Widget buildEnterOTPTextField() {
    return TextFieldWidget(
      controller: controller.otpVerifyController,
      hintText: LocaleKeys.enter_otp.tr,
      inputType: TextInputType.emailAddress,
      icon: const Icon(Icons.key_sharp),
    );
  }

  Widget buildButtonContinue() {
    return ButtonWidget(
      backgroundColor: UI.color.secondary,
      title: LocaleKeys.send_otp.tr,
      onTap: () => controller.sendOTP(),
    );
  }

  Widget buildEmailTextField() {
    return TextFieldWidget(
      controller: controller.emailController,
      hintText: LocaleKeys.email.tr,
      inputType: TextInputType.emailAddress,
      icon: const Icon(FontAwesomeIcons.envelope),
    );
  }
}
