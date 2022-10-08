import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MoneyTransferController extends BaseController {
  @override
  String? get pageTitle => 'debt_payment'.tr;
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  List<String> listOfBank = ['Ziraat Bankası', 'Vakıf Bank'];

  RxString iban = "TR90 8988 8884 9948 9988".obs;
  RxString descValue = "1489056".obs;

  // This function is triggered when the copy icon is pressed
  Future<void> copyToClipboard(String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    showSimpleSnackBar(
      message: 'Panoya Kopyalandı',
    );
  }

  navigateSuccessPage() {
    Get.toNamed('common', arguments: 'transferSuccess');
  }
}
