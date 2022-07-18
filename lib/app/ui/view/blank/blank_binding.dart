import 'package:apmatik_app/app/ui/view/blank/blank_controller.dart';

import 'package:get/get.dart';

class BlankBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BlankController>(BlankController());
  }
}
