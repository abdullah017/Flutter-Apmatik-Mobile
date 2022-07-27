import 'package:apmatik/app/ui/view/auth/additional_details/additional_details_controller.dart';
import 'package:get/get.dart';

class AdditionalDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AdditionalDetailsController>(AdditionalDetailsController());
  }
}
