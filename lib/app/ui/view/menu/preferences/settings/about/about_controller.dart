import 'package:apmatik/app/core/base/base_view.dart';
import 'package:get/get.dart';

class AboutController extends BaseController {
  @override
  // PAGE TITLE AREA IS HERE!
  String? get pageTitle => 'about'.tr;
  // NOTICE HERE THAT THE PAGE IS A MENU ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => true;
  @override
  void onInit() {
    super.onInit();
  }
}
