import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:get/get.dart';

class BottomNavbarController extends BaseController {
  int current = 0;
  var tabIndex = 0.obs;

  tabChange(int index) {
    tabIndex.value = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
