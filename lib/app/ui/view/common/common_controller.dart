import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:get/get.dart';

class CommonController extends BaseController {
  void goLogin() {
    Get.toNamed('/login');
  }

  @override
  void onInit() {
    super.onInit();
  }
}
