import 'package:apmatik/app/ui/view/menu/preferences/settings/aggrement/aggrement_controller.dart';
import 'package:get/get.dart';

class AggrementBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AggrementController>(AggrementController());
  }
}
