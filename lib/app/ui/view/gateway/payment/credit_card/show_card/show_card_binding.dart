import 'package:apmatik/app/ui/view/gateway/payment/credit_card/show_card/show_card_controller.dart';
import 'package:get/get.dart';

class ShowCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowCardController>(() => ShowCardController());
  }
}
