import 'package:apmatik/app/ui/view/gateway/payment_method/money_transfer/money_transfer_controller.dart';
import 'package:get/get.dart';

class MoneyTransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoneyTransferController>(() => MoneyTransferController());
  }
}
