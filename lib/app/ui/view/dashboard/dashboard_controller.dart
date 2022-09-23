// ignore_for_file: avoid_print

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends BaseController {
  @override
  RxBool get navBarHide => false.obs;

  @override
  bool? get showBottomSheet => false;

  List duyuru = [].obs;

  RxInt? radiValue = 1.obs;

  bool selectedRadio = false;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  selectUS(int? value) {
    radiValue!.value = value!;
    update();
  }

  addDuyuru() {
    duyuru.add('VALUE');
    print(duyuru[0]);
  }

  @override
  void onInit() {
    super.onInit();
    addDuyuru();
    tabIndex.value = 0;
  }
}
