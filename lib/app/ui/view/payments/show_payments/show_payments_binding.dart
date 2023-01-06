import 'package:get/get.dart';

import 'show_payments_controller.dart';

class ShowPaymentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowPaymentsController>(() => ShowPaymentsController());
  }
}
