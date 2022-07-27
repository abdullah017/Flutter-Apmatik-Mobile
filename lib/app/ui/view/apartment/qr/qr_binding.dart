import 'package:apmatik/app/ui/view/apartment/qr/qr_controller.dart';
import 'package:get/get.dart';

class QrBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<QrController>(QrController());
  }
}
