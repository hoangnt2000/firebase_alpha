import 'package:a5_location_sharing/app/modules/home/controllers/home_controller.dart';
import 'package:a5_location_sharing/app/modules/home/views/components/speed_unit_item.dart';
import 'package:a5_location_sharing/app/routes/app_pages.dart';
import 'package:a5_location_sharing/app/widgets/custom_switch_widget.dart';
import 'package:a5_location_sharing/generated/locales.g.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../ui/ui.dart';

class SideBarWidget extends GetView<HomeController> {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: UI.color.white,
      child: Column(
        children: [
          buildHeader(
            name: "<<name>>",
            address: "<<Location>>",
            icon: UI.icon.icGoogle,
          ),
          buildSwitchSharing(),
          buildTitleNotification(),
          buildSpeedUnit(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Divider(
              height: 1,
              color: UI.color.primary,
            ),
          ),
          buildTitleAppColor(),
          buildTitleLanguage(),
          buildTitleLogout(),
          const Spacer(),
          buildFooterSidebar(),
        ],
      ),
    );
  }

  Widget buildTitleLogout() {
    return listTitleTab(
        title: LocaleKeys.logout.tr,
        trailing: buildIconButton(
          onPressed: () {
            // controller.signOut();
          },
          icon: Icons.logout,
        ));
  }

  Widget buildTitleLanguage() {
    return listTitleTab(
      title: LocaleKeys.language.tr,
      trailing: buildIconButton(
        icon: Icons.language,
        onPressed: () {},
      ),
    );
  }

  Widget buildTitleAppColor() {
    return listTitleTab(
        title: LocaleKeys.app_color.tr,
        trailing: buildIconButton(
          onPressed: () {},
          icon: Icons.color_lens,
        ));
  }

  Widget buildSpeedUnit() {
    return listTitleTab(
      title: LocaleKeys.speed_unit.tr,
      trailing: const SpeedUnitItem(),
    );
  }

  Widget buildTitleNotification() {
    return listTitleTab(
      title: LocaleKeys.notification.tr,
      trailing: Obx(
        () => buildIconButton(
          onPressed: () {
            controller.isMute.value = !controller.isMute.value;
          },
          icon: controller.isMute.value
              ? Icons.notifications_off
              : Icons.notifications_on,
        ),
      ),
    );
  }

  Widget buildSwitchSharing() {
    return listTitleTab(
      title: LocaleKeys.your_location.tr,
      trailing: CustomSwitchWidget(
        value: true,
        thumbColor: UI.color.white,
        trackColor: UI.color.primary,
      ),
    );
  }

  IconButton buildIconButton(
      {required Function() onPressed, required IconData icon}) {
    return IconButton(
      color: UI.color.primary,
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }

  Widget buildFooterSidebar() {
    return Column(
      children: [
        Text(
          LocaleKeys.app_name.tr,
          style: UI.textStyle.Body.copyWith(
            fontWeight: FontWeight.bold,
            color: UI.color.primary,
          ),
        ),
        Text(
          "Version 1.0.0",
          style: UI.textStyle.Label.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget listTitleTab({
    required String title,
    required Widget trailing,
  }) {
    return ListTile(
      title: Text(
        title,
        style: UI.textStyle.Body.copyWith(
          fontWeight: FontWeight.bold,
          color: UI.color.primary,
        ),
      ),
      trailing: trailing,
    );
  }

  Widget buildHeader({
    required String name,
    required String address,
    required String icon,
  }) =>
      Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: UI.color.white,
              child: SvgPicture.asset(
                icon,
                height: 50,
                width: 50,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: UI.textStyle.H4.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: UI.textStyle.Label
                      .copyWith(fontWeight: FontWeight.normal),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.PROFILE);
              },
              icon: const Icon(Icons.edit),
            )
          ],
        ),
      );
}
