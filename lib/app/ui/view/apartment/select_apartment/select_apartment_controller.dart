import 'package:apmatik/app/core/base/base_view.dart';

import 'package:get/get.dart';

class SelectApartmentController extends BaseController {
  void goCommonPage() {
    Get.toNamed('common', arguments: 'registerApartmentSuccess');
  }

  @override
  void onInit() {
    super.onInit();
  }
}
