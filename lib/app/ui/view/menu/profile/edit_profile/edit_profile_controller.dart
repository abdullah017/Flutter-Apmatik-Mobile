import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProfileController extends BaseController {
  @override
  // PAGE TITLE AREA IS HERE!
  String? get pageTitle => 'edit_profile'.tr;
  // NOTICE HERE THAT THE PAGE IS A MENU AND SETTING ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  List<String> joblist = [
    "Öğrenci",
    "Öğretmen",
    "Serbest Meslek",
    "Avukat",
    "Doktor",
    "Yazılım Geliştiricisi"
  ].obs;

  List<String> marital = [
    "Evli",
    "Bekar",
  ].obs;

  List<String> listOfChildValue = [
    'Çocuğum Yok',
    '1 çocuk',
    '2 çocuk',
    '3 çocuk',
    '4 çocuk',
    '5 veya daha fazla çocuk'
  ].obs;

  List<String> pet = [
    "Var",
    "Yok",
  ].obs;

  String? selectedJobValue = 'Öğrenci';
  String? selectedDurum = 'Evli';
  bool toggle = false;

  TextEditingController phoneNumberController =
      TextEditingController(text: '+90 548 865 56381');

  @override
  void onInit() {
    super.onInit();
    tabIndex = 4;
    phoneNumberController;
  }
}
