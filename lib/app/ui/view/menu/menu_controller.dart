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
    var loginStatus = box.read('isLogin');
    print(loginStatus);
    if (loginStatus == true) {
      box.write('isLogin', false);
      Get.offNamedUntil('splash', (route) => false);
      Get.deleteAll();
    }
    // box.listenKey('isLogin', (newValue) {
    //   //box.write('hasApertmen', newValue);
    //   print(box.read('isLogin'));
    //   var loginStatus = box.read('isLogin');
    //   print(loginStatus);
    //   if (loginStatus == true) {
    //     box.remove('isLogin');
    //     Get.offNamedUntil('splash', (route) => false);
    //   }
    //   update();
    // });
    // box.remove('isLogin');
    // print(box.read('isLogin'));
    // Get.offNamedUntil('splash', (route) => false);
  }

  @override
  void onInit() {
    navBarHide.value = false;
    super.onInit();
    tabIndex = 4;
  }
}
