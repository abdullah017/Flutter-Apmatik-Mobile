import 'package:apmatik/app/core/base/base_view.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  void goEditProfileView() {
    Get.toNamed('edit_profile');
  }

  @override
  void onInit() {
    super.onInit();
    tabIndex = 4;
  }
}
