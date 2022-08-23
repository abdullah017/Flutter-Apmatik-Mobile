import 'package:apmatik/app/core/base/base_view.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrController extends BaseController {
  @override
  // PAGE TITLE AREA IS HERE!
  String? get pageTitle => 'registerWithQr'.tr;
  // NOTICE HERE THAT THE PAGE IS A MENU AND SETTING ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  MobileScannerController qrController = MobileScannerController();

  @override
  void onInit() {
    super.onInit();
  }
}
