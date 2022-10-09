// ignore_for_file: avoid_print, avoid_renaming_method_parameters

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddApertmentController extends BaseController
    with GetSingleTickerProviderStateMixin {
  @override
  // PAGE TITLE AREA IS HERE!
  String? get pageTitle => '';
  // NOTICE HERE THAT THE PAGE IS A MENU AND SETTING ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  TabController? tabController;

  String? selectedValue = 'Türkiye';
  String? selectedCity = 'İzmir';
  String? selectedDistrict = 'Bornova';
  int toggleValue = 0;
  List<String> listOfCountry = ['Türkiye', 'Almanya'];
  List<String> listOfCitys = ['İstanbul', 'İzmir'];
  List<String> listOfDistricts = ['Tuzla', 'Bornova'];
  List<bool> isSelected = [true, false, false];

  TextEditingController apartmenNameController = TextEditingController();
  GlobalKey<FormState> addApartmenFormKey = GlobalKey<FormState>();

  void goQrPage() {
    Get.toNamed('/readqr');
  }

  void goManualSearchResult() {
    if (addApartmenFormKey.currentState!.validate()) {
      Get.toNamed('/selectapartment');
    } else {
      print('HATALI FORM');
    }
  }

 
  @override
   tabChange(int newIndex) {
    for (int index = 0; index < isSelected.length; index++) {
      if (index == newIndex) {
        isSelected[index] = true;
        print(index); //button index no
        update();
      } else {
        isSelected[index] = false;
        print(index); //button index no
        update();
      }
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabIndex.value = 4;
  }

  @override
  void onClose() {
    super.onClose();
    apartmenNameController;
  }
}
