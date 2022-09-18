// ignore_for_file: avoid_print

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends BaseController {
  // PAGE TITLE AREA IS HERE!
  @override
  String? get pageTitle => 'upPassword'.tr;
  // NOTICE HERE THAT THE PAGE IS A MENU ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;

  @override
  bool? get isSettingItem => true;

  GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();

  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController reNewPassController = TextEditingController();

  updatePassword() {
    if (!updatePasswordFormKey.currentState!.validate()) {
      print('ŞİFRE DEĞİŞTİRME BAŞARISIZ');
    } else {
      print('ŞİFRE DEĞİŞTİRME BAŞARILI');
    }
  }

  @override
  void onInit() {
    super.onInit();
    tabIndex = 4;
    oldPassController;
    newPassController;
    reNewPassController;
  }

  @override
  void onClose() {
    super.onClose();
    oldPassController;
    newPassController;
    reNewPassController;
  }
}
