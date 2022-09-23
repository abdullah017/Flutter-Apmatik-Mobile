import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class GatewayController extends BaseController {
  @override
  RxBool get navBarHide => false.obs;

  @override
  bool? get showBottomSheet => false;

  @override
  void onInit() {
    tabIndex.value = 0;
    super.onInit();
  }
}
