import 'package:apmatik/app/ui/view/guest_card/show_guest_card/show_guestcard_controller.dart';
import 'package:get/get.dart';

class ShowGuestCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowGuestCardController>(() => ShowGuestCardController());
  }
}
