import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class ShowGuestCardController extends BaseController {
  @override
  RxBool get navBarHide => false.obs;

  navigateAddGuest() {
    Get.toNamed('add_guestcard');
  }

  @override
  void onInit() {
    tabIndex.value = 0;
    super.onInit();
  }
}
