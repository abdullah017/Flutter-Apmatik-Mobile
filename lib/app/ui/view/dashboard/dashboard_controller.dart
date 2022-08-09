import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends BaseController {
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
    tabIndex = 0;
  }
}
