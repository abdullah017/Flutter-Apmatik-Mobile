import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class ShowCarsController extends BaseController {
  @override
  RxBool get navBarHide => false.obs;
  @override
  String? get pageTitle => 'my_cars'.tr;
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  List cars = [1, 2, 3, 4, 6];

  @override
  void onInit() {
    tabIndex.value = 0;

    super.onInit();
  }
}
