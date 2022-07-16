import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends BaseController {
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void goOtpPage() {
    try {
      if (forgotPasswordFormKey.currentState!.validate()) {
        Get.toNamed('otp', arguments: 'phonenumber and emailadress');
      } else {
        //
      }
    } catch (e) {
      print(e);
    }
  }
}
