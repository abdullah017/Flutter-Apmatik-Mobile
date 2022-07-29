import 'package:apmatik/app/core/base/base_view.dart';

class PreferencesController extends BaseController {
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

  @override
  void onInit() {
    super.onInit();
  }
}
