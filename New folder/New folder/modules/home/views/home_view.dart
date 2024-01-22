// ignore_for_file: unused_local_variable

import '../../../routes/app_pages.dart';
import 'components/side_bar_widget.dart';
import '../../../ui/ui.dart';
import '../../../widgets/app_bar_widget.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const LatLng currentLocation = LatLng(10.8085, 106.6654);
    return Scaffold(
        key: controller.scaffoldKey,
        drawer: const SideBarWidget(),
        backgroundColor: UI.color.white,
        body: Stack(
          children: [
            const GoogleMap(
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: true,
              rotateGesturesEnabled: true,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              buildingsEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 14,
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                AppBarWidget(
                  preFunction: () {
                    controller.drawer();
                  },
                  preIcon: const FaIcon(FontAwesomeIcons.bars),
                  title: '',
                  sufIcon: const Text('Screen Test'),
                  sufFunction: () {
                    Get.toNamed(Routes.FRIEND_LIST);
                  },
                ),
              ],
            )
          ],
        ));
  }
}
