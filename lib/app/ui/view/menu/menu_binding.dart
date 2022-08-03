

import 'package:apmatik/app/ui/view/menu/menu_controller.dart';
import 'package:apmatik/app/ui/view/profile/show_profile/profile_controller.dart';
import 'package:get/get.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MenuController>(MenuController());
    Get.lazyPut(() => ProfileController());

  }
}
