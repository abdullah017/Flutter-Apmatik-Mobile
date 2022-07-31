import 'package:apmatik/app/ui/view/about/about_controller.dart';

import 'package:get/get.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AboutController>(AboutController());
  }
}
