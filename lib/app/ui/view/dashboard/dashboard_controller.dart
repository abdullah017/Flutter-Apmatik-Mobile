import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:get/get.dart';

class DashBoardController extends BaseController {
  List duyuru = [].obs;

  int radiovalue = -1;

  bool selectedRadio = false;

  addDuyuru() {
    duyuru.add('VALUE');
    print(duyuru[0]);
  }

  @override
  void onInit() {
    super.onInit();
    addDuyuru();
  }
}
