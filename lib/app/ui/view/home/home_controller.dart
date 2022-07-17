import 'package:apmatik_app/app/core/base/base_controller.dart';

class HomeController extends BaseController {
  @override
  void onInit() {
    box.write('isLogin', true);
    super.onInit();
  }
}
