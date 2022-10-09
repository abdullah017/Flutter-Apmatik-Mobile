import 'package:apmatik/app/ui/view/guest_card/add_guest_card/add_guest_controller.dart';
import 'package:get/get.dart';

class AddGuestBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddGuestCardController>(() => AddGuestCardController());
  }
}