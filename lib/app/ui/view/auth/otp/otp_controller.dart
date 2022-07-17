import 'dart:async';

import 'package:apmatik_app/app/core/base/base_controller.dart';
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
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  AnimationController? animationController;

  @override
  void onInit() {
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

    //getUserPhone();
    super.onInit();
  }

  @override
  void dispose() {
    errorController!.close();
    animationController!.dispose();
    super.dispose();
  }

  statusPage() {
    try {
      Get.toNamed('common', arguments: '1');
    } catch (e) {
      print(e);
    }
  }

  // void getUserPhone() {
  //   storageList.value = box.read('userData');
  //   print(storageList[3]);
  //   phone = storageList[3];
  // }

  goHomePage() {
    Get.toNamed('home');
  }

  // snackBar(String? message) {
  //   return showSnackBar('HATA', message!, Colors.black, true, '');
  // }
}
