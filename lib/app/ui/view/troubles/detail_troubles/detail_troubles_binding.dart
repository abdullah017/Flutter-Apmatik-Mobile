import 'package:apmatik/app/ui/view/troubles/detail_troubles/detail_troubles_controller.dart';
import 'package:get/get.dart';

class DetailTroublesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTroublesController>(() => (DetailTroublesController()));
  }
}
