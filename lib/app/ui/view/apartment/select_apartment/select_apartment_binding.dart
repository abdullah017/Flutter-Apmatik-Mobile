import 'package:apmatik_app/app/ui/view/apartment/select_apartment/select_apartment_controller.dart';


import 'package:get/get.dart';

class SelectApartmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SelectApartmentController>(SelectApartmentController());
  
  }
}
