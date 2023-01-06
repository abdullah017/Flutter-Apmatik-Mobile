import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/new_card/newcard_controller.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/select_card_controller.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/show_card/show_card_controller.dart';
import 'package:get/get.dart';

class SelectCreditCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectCreditCardController>(() => SelectCreditCardController());
    Get.lazyPut<NewCardController>(() => NewCardController(), fenix: true);
    Get.lazyPut<ShowCardController>(() => ShowCardController(), fenix: true);
  }
}
