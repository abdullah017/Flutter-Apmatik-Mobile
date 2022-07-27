import 'package:apmatik/app/ui/view/auth/forgot_password/forgotpassword_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(ForgotPasswordController());
  }
}
