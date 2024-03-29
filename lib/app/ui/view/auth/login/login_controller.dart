// ignore_for_file: avoid_print

import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  RxBool isPasswordHidden = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isPasswordHidden;
    emailController;
    passwordController;
  }

  changePasswordShowStatus() {
    isPasswordHidden.value = !isPasswordHidden.value;
    print(isPasswordHidden.value);
    update();
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      //Get.offNamedUntil('splash', (route) => false);
      Get.offNamedUntil('home', (route) => false)!.then((value) {
        box.write('isLogin', true);
        emailController.clear();
        passwordController.clear();
      });
      print('YES');
    } else {
      print('NO!');
    }
  }

  void goToForgotPassword() {
    Get.toNamed("forgotpassword");
  }

  @override
  void onClose() {
    super.onClose();
    emailController;
    passwordController;
  }
}
