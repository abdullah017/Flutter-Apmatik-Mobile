import 'package:apmatik/app/core/base/base_view.dart';
import 'package:get/get.dart';

class PreferencesController extends BaseController {
  bool paySwitch = true;
  bool systemSwitch = true;
  bool advantageSwitch = false;

  void paySwitchChange(val) {
    paySwitch = val;
    update();
  }

  void systemSwitchChange(val) {
    systemSwitch = val;
    update();
  }

  void advantageSwitchChange(val) {
    advantageSwitch = val;
    update();
  }

  void goToLanguageSettingView() {
    Get.toNamed('languages');
  }

  void goToUpdatePasswordView() {
    Get.toNamed('update_password');
  }

  void goToAggrementsView() {
    Get.toNamed('aggrement');
  }

  void goToFeedBackView() {
    Get.toNamed('report');
  }

  void goToAboutView() {
    Get.toNamed('about');
  }

  @override
  void onInit() {
    super.onInit();
  }
}
