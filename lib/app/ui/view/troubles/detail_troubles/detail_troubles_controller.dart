import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTroublesController extends BaseController
    with GetSingleTickerProviderStateMixin {
  @override
  String? get pageTitle => 'troubles_list'.tr;
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  GlobalKey<FormState> guestCardFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TabController? tabController;

  List<bool> isSelected = [true, false, false, false];

  @override
  tabChange(index) {
    for (int value = 0; value < isSelected.length; value++) {
      if (value == index) {
        isSelected[value] = true;
        print(index); //button index no
        update();
      } else {
        isSelected[value] = false;
        // print(index); //button index no
        update();
      }
      update();
    }
  }

  @override
  void onInit() {
    nameController;
    super.onInit();
  }

  @override
  void dispose() {
    nameController;
    super.dispose();
  }
}
