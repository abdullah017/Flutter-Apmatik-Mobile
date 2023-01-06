import 'package:apmatik/app/ui/view/troubles/show_troubles/show_troubles_controller.dart';
import 'package:get/get.dart';

class ShowTroublesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowTroublesController>(() => ShowTroublesController());
  }
}
