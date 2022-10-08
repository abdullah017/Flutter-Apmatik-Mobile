import 'package:apmatik/app/ui/view/payment/credit_card/new_card/newcard_controller.dart';
import 'package:get/instance_manager.dart';

class NewCardBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<NewCardController>(() => NewCardController());
  }
}