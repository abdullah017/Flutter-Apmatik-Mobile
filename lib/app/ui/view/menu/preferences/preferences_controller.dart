import 'package:apmatik/app/core/base/base_view.dart';
import 'package:get/get.dart';

class PreferencesController extends BaseController {
  @override
  // PAGE TITLE AREA IS HERE!
  String? get pageTitle => 'preferences'.tr;
  // NOTICE HERE THAT THE PAGE IS A MENU AND SETTING ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => true;
  //OTHER VARIABLES
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
