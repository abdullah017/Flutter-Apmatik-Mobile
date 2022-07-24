import 'package:apmatik_app/app/ui/view/blank/blank_controller.dart';
import 'package:apmatik_app/app/ui/view/bottom_navbar/bottom_navbar_controller.dart';
import 'package:apmatik_app/app/ui/view/common/common_controller.dart';
import 'package:apmatik_app/app/ui/view/dashboard/dashboard_controller.dart';
import 'package:apmatik_app/app/ui/view/home/home_controller.dart';

import 'package:get/get.dart';

class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BottomNavbarController>(BottomNavbarController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BlankController());
    Get.lazyPut(() => CommonController());
    Get.lazyPut(() => DashBoardController());
  }
}
