import 'package:get/get.dart';

import '../controllers/friend_list_controller.dart';

class FriendListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FriendListController>(
      () => FriendListController(),
    );
  }
}
