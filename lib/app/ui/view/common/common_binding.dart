import 'package:apmatik/app/ui/view/common/common_controller.dart';

import 'package:get/get.dart';

class CommonBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CommonController>(CommonController());
  }
}
