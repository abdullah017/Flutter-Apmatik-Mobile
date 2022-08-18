import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagesController extends BaseController {
  @override
  // PAGE TITLE AREA IS HERE!
  String? get pageTitle => 'languageSettings'.tr;
  // NOTICE HERE THAT THE PAGE IS A MENU ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => true;
  int selectedValue = 0;

  selectTR(value) {
    selectedValue = value!;
    Get.updateLocale(const Locale('tr', 'TR'));
    box.write('languages', selectedValue); //
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
    selectedValue = box.read('languages') ?? 0;
  }
}
