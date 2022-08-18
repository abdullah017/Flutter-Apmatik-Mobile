import 'package:apmatik/app/core/base/base_view.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  @override
  // PAGE TITLE AREA IS HERE!
  String? get pageTitle => 'profile'.tr;
  // NOTICE HERE THAT THE PAGE IS A MENU AND SETTING ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  List cars = [];

  void goEditProfileView() {
    Get.toNamed('edit_profile');
  }

  @override
  void onInit() {
    super.onInit();
    tabIndex = 4;
  }
}
