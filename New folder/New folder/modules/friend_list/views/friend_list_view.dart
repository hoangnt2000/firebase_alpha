import 'package:a5_location_sharing/app/ui/ui.dart';
import 'package:a5_location_sharing/app/widgets/app_bar_widget.dart';
import 'package:a5_location_sharing/app/widgets/default_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/friend_list_controller.dart';

class FriendListView extends GetWidget<FriendListController> {
  const FriendListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultPage(
        appBar: AppBarWidget(
          preFunction: () {
            Get.back();
          },
          preIcon: FaIcon(FontAwesomeIcons.arrowLeft, color: UI.color.primary),
          sufIcon: null,
          title: 'Friend List',
          sufFunction: () {},
        ),
        bodyWidget: Container(),
      ),
    );
  }
}
