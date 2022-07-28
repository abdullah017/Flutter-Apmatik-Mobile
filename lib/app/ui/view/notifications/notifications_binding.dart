import 'package:apmatik/app/ui/view/notifications/notifications_controller.dart';

import 'package:get/get.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificationsController>(NotificationsController());
  }
}
