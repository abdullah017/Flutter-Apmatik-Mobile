import 'package:apmatik/app/ui/view/dashboard/dashboard_controller.dart';

import 'package:get/get.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashBoardController>(DashBoardController());
  }
}
