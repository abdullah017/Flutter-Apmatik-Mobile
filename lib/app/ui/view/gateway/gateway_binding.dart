import 'package:apmatik/app/ui/view/gateway/gateway_controller.dart';
import 'package:get/get.dart';

class GatewayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GatewayController>(() => GatewayController());
  }
}
