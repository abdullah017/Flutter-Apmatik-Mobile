
import 'package:apmatik_app/app/core/controller/images_list_controller.dart';
import 'package:get/get.dart';



class ImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ImagesController>(ImagesController(Get.find()));
  }
}
