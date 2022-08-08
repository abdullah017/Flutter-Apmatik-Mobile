import 'package:apmatik/app/ui/view/menu/staff/staff_controller.dart';
import 'package:get/get.dart';

class StaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StaffController>(StaffController());
  }
}
