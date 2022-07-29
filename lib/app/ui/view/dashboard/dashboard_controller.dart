import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends BaseController {
  List duyuru = [].obs;

  int radiovalue = -1;

  bool selectedRadio = false;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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
