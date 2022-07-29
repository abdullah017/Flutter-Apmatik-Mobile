import 'package:apmatik/app/ui/view/settings/preferences/preferences_controller.dart';
import 'package:get/get.dart';

class PreferencesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PreferencesController>(PreferencesController());
  }
}
