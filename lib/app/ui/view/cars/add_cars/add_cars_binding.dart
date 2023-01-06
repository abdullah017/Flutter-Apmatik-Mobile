import 'package:apmatik/app/ui/view/cars/add_cars/add_cars_controller.dart';
import 'package:get/get.dart';

class AddCarsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCarsController>(() => AddCarsController());
  }
}
