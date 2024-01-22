import 'package:a5_location_sharing/app/ui/ui.dart';
import 'package:a5_location_sharing/app/widgets/button_widget.dart';
import 'package:a5_location_sharing/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildPictureProfile(),
            const SizedBox(height: 10),
            buildNameWidget(),
            buildEmailWidget(),
            const Divider(),
            const SizedBox(height: 20),
            buildButtonDelete(),
          ],
        ),
      ),
    );
  }

  Widget buildPictureProfile() {
    return Stack(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SvgPicture.asset(
              UI.icon.icMap,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: UI.color.secondary,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.photo_camera_outlined),
            ),
          ),
        )
      ],
    );
  }

  Widget buildNameWidget() {
    return Text(
      "<<name>>",
      style: UI.textStyle.H2.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildEmailWidget() {
    return Text(
      "<<email>",
      // "${firebaseAuth.currentUser!.email}",
      style: UI.textStyle.H3.copyWith(
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget buildButtonDelete() {
    return GestureDetector(
      onTap: () {
        showDialogConfirm();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1),
        ),
        child: Center(
          child: Text(
            LocaleKeys.delete_account.tr,
            style: TextStyle(
              color: UI.color.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showDialogConfirm() {
    return showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text(LocaleKeys.confirm_delete.tr)),
            content: Text(LocaleKeys.ask_delete.tr),
            actions: [
              Row(
                children: [
                  buildActionButton(
                    onTap: () => Get.back(),
                    title: LocaleKeys.button_cancel.tr,
                    isCancel: true,
                  ),
                  buildActionButton(
                    onTap: () => controller.deleteUser(),
                    title: LocaleKeys.button_del.tr,
                  )
                ],
              )
            ],
          );
        });
  }

  Widget buildActionButton({
    required Function() onTap,
    required String title,
    bool isCancel = false,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: ButtonWidget(
          title: title,
          onTap: onTap,
          backgroundColor: isCancel ? UI.color.secondary : UI.color.red,
        ),
      ),
    );
  }
}
