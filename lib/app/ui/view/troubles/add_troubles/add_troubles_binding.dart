import 'package:apmatik/app/ui/view/troubles/add_troubles/add_troubles_controller.dart';
import 'package:get/get.dart';

class AddTroublesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddTroublesController>(() => AddTroublesController());
  }
}