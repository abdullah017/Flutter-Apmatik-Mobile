import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ForgotPasswordController extends BaseController {
  @override
  // PAGE TITLE AREA IS HERE!
  String? get pageTitle => '';
  // NOTICE HERE THAT THE PAGE IS A MENU AND SETTING ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();

  RxString? error = ''.obs;
  RxBool validForm = true.obs;
  PhoneNumber? phoneNumberWithRegion;

  RxString validationMessage = ''.obs;
  RxBool correctPhoneNumber = false.obs;
  var number;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    phoneNumberController;
    super.onClose();
  }

  void goOtpPage() {
    try {
      if (forgotPasswordFormKey.currentState!.validate() &&
          validForm.value == false) {
        Get.toNamed('otp', arguments: [
          {"number": number},
          {"page": 'forgot'}
        ]);
      } else {
        print('NONONO');
      }
    } catch (e) {
      print(e);
    }
  }
}
