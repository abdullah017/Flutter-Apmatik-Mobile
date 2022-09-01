import 'package:apmatik/app/core/base/base_view.dart';
import 'package:get/get.dart';

class MenuController extends BaseController {
  @override
  RxBool get navBarHide => false.obs;

  @override
  bool? get showBottomSheet => false;

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
    box.write('isLogin', false);
    print(box.read('isLogin'));
    Get.offAllNamed('splash');
  }

  @override
  void onInit() {
    navBarHide.value = false;
    super.onInit();
    tabIndex = 4;
  }
}
