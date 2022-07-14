
import 'package:apmatik_app/app/core/controller/images-details.dart';
import 'package:get/get.dart';





class ImagesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ImagesDetailsController>(ImagesDetailsController(Get.find()));
  }
}
