import 'package:apmatik/app/core/base/base_view.dart';
import 'package:get/get.dart';

class MenuController extends BaseController {
  void goToProfileView() {
    Get.toNamed('profile');
  }

  void goToSettingsView() {
    Get.toNamed('preferences');
  }

  void goToAddApartmentView() {
    Get.toNamed('add_apertmen');
  }

  void goToAddStaffView() {
    Get.toNamed('staff');
  }

  void clearStorage() {
    box.remove('isLogin');
    print(box.read('isLogin'));
    Get.offAllNamed('splash');
  }

  @override
  void onInit() {
    super.onInit();
    tabIndex = 4;
  }
}
