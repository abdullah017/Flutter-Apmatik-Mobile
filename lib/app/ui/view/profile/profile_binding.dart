import 'package:apmatik/app/ui/view/profile/profile_controller.dart';

import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }
}
