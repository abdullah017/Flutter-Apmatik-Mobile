import 'package:apmatik/app/ui/view/payments/detail_payments/detail_payments_controller.dart';
import 'package:get/get.dart';

class DetailPaymentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentDetailControlelr>(() => (PaymentDetailControlelr()));
  }
}
