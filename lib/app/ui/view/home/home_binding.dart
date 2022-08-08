import 'package:apmatik/app/ui/view/common/common_controller.dart';
import 'package:apmatik/app/ui/view/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.lazyPut<CommonController>(() => CommonController());
  }
}
