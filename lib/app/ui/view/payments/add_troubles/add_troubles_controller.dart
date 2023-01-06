import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTroublesController extends BaseController
    with GetSingleTickerProviderStateMixin {
  @override
  String? get pageTitle => 'troubles_list'.tr;
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  GlobalKey<FormState> guestCardFormKey = GlobalKey<FormState>();

  String? selectApartmenValue = 'Selveli Apartmanı';
  String? selectTroublesValue = 'Su Arızası';

  List<String> listOfApartmenName = [
    'Selveli Apartmanı',
    'Burak Sitesi',
    'Ayça Apartmanı'
  ];
  List<String> listOfTroubles = [
    'Su Arızası',
    'Elektrik Arızası',
    'Doğalgaz Arızası'
  ];
}
