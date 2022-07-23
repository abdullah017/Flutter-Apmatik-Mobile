import 'package:apmatik_app/app/ui/view/apartment/add_apartment/add_apertment_controller.dart';
import 'package:get/get.dart';

class AddApertmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AddApertmentController>(AddApertmentController());
  }
}
