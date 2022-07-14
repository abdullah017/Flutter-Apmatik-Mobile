
import 'package:apmatik_app/app/core/controller/videos_list_controller.dart';
import 'package:get/get.dart';



class VideosBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VideosController>(VideosController(Get.find()));
  }
}
