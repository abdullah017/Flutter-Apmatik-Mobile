import 'package:apmatik/app/ui/view/menu/menu_controller.dart';
import 'package:get/get.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MenuController>(MenuController());
  }
}
