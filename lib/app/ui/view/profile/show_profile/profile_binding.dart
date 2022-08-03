
import 'package:apmatik/app/ui/view/profile/show_profile/profile_controller.dart';

import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());

  }
}
