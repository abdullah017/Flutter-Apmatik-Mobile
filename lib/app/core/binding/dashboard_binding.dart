

import 'package:apmatik_app/app/core/controller/dashboard-controller.dart';
import 'package:get/get.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
  }
}
