import 'package:apmatik_app/app/ui/view/auth/otp/otp_controller.dart';
import 'package:get/get.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OtpController>(OtpController());
  }
}
