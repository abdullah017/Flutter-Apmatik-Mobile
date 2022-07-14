import 'package:apmatik_app/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

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

  login() {
    if (loginFormKey.currentState!.validate()) {
      print('YES');
    } else {
      print('NO');
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController;
    passwordController;
  }
}
