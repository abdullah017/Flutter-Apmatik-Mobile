import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagesController extends BaseController {
  int selectedValue = 0;

  selectTR(value) {
    selectedValue = value!;
    Get.updateLocale(const Locale('tr', 'TR'));
    box.write('languages', selectedValue);
    update();
  }

  selectUS(value) {
    selectedValue = value!;
    Get.updateLocale(const Locale('en', 'US'));
    box.write('languages', selectedValue);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    box.read('languages');
    selectedValue = box.read('languages');
  }
}
