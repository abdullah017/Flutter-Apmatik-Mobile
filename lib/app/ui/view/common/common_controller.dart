import 'package:apmatik/app/core/base/base_view.dart';
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
      Get.offNamedUntil('home', (route) => true);
    });
  }

  @override
  void onInit() {
    super.onInit();
    // status = Get.arguments ;
  }
}
