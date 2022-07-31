import 'package:apmatik/app/ui/view/auth/update_password/update_password_controller.dart';
import 'package:get/get.dart';

class UpdatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UpdatePasswordController>(UpdatePasswordController());
  }
}
