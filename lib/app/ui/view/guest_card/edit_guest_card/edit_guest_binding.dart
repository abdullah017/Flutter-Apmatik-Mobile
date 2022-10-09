import 'package:apmatik/app/ui/view/guest_card/edit_guest_card/edit_guest_controller.dart';
import 'package:get/get.dart';

class EditGuestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditGuestCardController>(() => (EditGuestCardController()));
  }
}
