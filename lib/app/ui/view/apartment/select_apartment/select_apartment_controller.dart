import 'package:apmatik_app/app/core/base/base_view.dart';

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
