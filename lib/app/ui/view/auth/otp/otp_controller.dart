// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:async';

import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  RxInt counter = 0.obs;
  RxInt levelClock = 120.obs;
  Rx<bool> hasError = false.obs;
  RxString currentText = "".obs;
  RxList storageList = [].obs;

  var phone;
  var dataRegister;
  dynamic dataForgotPassword = Get.arguments;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  AnimationController? animationController;
  FocusNode myFocusNode = FocusNode();

  @override
  void onInit() {
    print(dataForgotPassword[1]['page']);

    myFocusNode;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: levelClock.value),
    );

    animationController!.addListener(() {
      if (levelClock.value == 0) {
        print('SÜRE BİTTİ BEN DİNLİYORUM');
        animationController!.forward();
      }
    });

    animationController!.forward();
    errorController = StreamController<ErrorAnimationType>();
    dataRegister = box.read('userData');
    if (dataRegister != null) {
      getUserPhone();
    }
    if (dataForgotPassword != null) {
      print(dataForgotPassword);
      phone = dataForgotPassword[0]['number'];
    } else {
      phone = 'BİLİNMEYEN NUMARA';
    }

    super.onInit();
  }

  @override
  void onClose() {
    errorController!.close();
    animationController!.dispose();
    textEditingController;

    super.onClose();
  }

  gosAdditionalPage() {
    if (formKey.currentState!.validate()) {
      Get.offAndToNamed('additional_details');
      print(hasError.value);
      print('EWVET');
    }
    if (formKey.currentState!.validate() &&
        dataForgotPassword[1]['page'] == 'forgot') {
      Get.offNamedUntil('login', (route) => false);
      print(hasError.value);
      print('EWVET');
    } else {
      print(hasError.value);
      print('OTP HATA VERDİ');
    }
  }

  void getUserPhone() {
    storageList.value = box.read('userData');
    print(storageList[3]);
    phone = storageList[3];
  }

  goHomePage() {
    Get.toNamed('home');
  }
}
