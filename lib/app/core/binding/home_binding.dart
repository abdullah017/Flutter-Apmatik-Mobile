
import 'package:apmatik_app/app/core/controller/home_controller.dart';
import 'package:get/get.dart';



class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
