import 'package:apmatik/app/core/base/base_view.dart';
import 'package:get/get.dart';

class StaffController extends BaseController {
  @override
  String? get pageTitle => 'apartment_managers'.tr;
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  @override
  void onInit() {
    super.onInit();
    tabIndex.value = 4;
  }
}
