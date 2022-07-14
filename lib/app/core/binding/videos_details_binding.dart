
import 'package:apmatik_app/app/core/controller/video-details.dart';
import 'package:get/get.dart';

class VideosDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VideosDetailsController>(VideosDetailsController(Get.find()));
  }
}
