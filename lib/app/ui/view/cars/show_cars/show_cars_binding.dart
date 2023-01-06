import 'package:apmatik/app/ui/view/cars/show_cars/show_cars_controller.dart';
import 'package:get/get.dart';

class ShowCarsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowCarsController>(() => ShowCarsController());
  }
}
