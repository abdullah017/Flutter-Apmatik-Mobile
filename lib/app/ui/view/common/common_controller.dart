import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/ui/view/apartment/add_apartment/add_apertment_controller.dart';
import 'package:get/get.dart';

class CommonController extends BaseController {
  late String status = Get.arguments;

  void goLogin() {
    Get.toNamed('/login');
  }

  void goAddApartment() {
    Get.toNamed('/add_apertmen');
  }

  void goToHome() {
    box.write('hasApertmen', true).whenComplete(() {
      Get.toNamed(
        'home',
      );
      Get.delete<AddApertmentController>();
    });
  }
}
