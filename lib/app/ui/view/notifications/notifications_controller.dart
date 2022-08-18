import 'package:apmatik/app/core/base/base_view.dart';
import 'package:get/get.dart';

class NotificationsController extends BaseController {
  @override
  // PAGE TITLE AREA IS HERE!
  String? get pageTitle => 'notification'.tr;
  // NOTICE HERE THAT THE PAGE IS A MENU AND SETTING ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;
  @override
  void onInit() {
    super.onInit();
  }
}
