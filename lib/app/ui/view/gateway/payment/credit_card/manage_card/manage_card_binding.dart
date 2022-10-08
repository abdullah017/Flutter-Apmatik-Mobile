import 'package:apmatik/app/ui/view/gateway/payment/credit_card/manage_card/manage_card_controller.dart';
import 'package:get/get.dart';

class ManageCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageCardController>(() => ManageCardController());
  }
}
