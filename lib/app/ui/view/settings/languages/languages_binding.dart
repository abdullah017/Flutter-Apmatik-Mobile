import 'package:apmatik/app/ui/view/settings/languages/languages_controller.dart';
import 'package:get/get.dart';

class LanguagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LanguagesController>(LanguagesController());
  }
}
