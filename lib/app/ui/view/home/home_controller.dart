// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:async';
import 'dart:io';

import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  @override
  RxBool get navBarHide => hasApartmenValue;

  var subPageId = 0;

  @override
  RxBool? get isNotification => true.obs;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];
  List<String> cardlist = [
    'Tümü',
    'Duyurular',
    'Anketler',
    'Sponsorlar',
  ].obs;
  String selectedValue = 'Duyurular';
  int current = 0;
  var hasApertmenKey;
  RxBool hasApartmenValue = false.obs;
  final CarouselController carouselController = CarouselController();

  Future<bool> onWillPop() async {
    if (Platform.isIOS) {
      await showCupertinoDialog(
        context: Get.context!,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('DENEME'),
          content: const Text('DENEME'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            CupertinoDialogAction(
              child: const Text('DEFAULT'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      );
    } else {
      true;
      SystemNavigator.pop();
    }

    return (await showDialog(
          context: Get.context!,
          builder: (context) => const AlertDialog(),
        )) ??
        false;
  }

  apertmenRecord() {
    box.write('hasApertmen', false);
    update();
  }

  updateRecordState() {
    box.listenKey('hasApertmen', (newValue) {
      //box.write('hasApertmen', newValue);
      print(box.read('hasApertmen'));
      hasApertmenKey = box.read('hasApertmen');
      print(hasApertmenKey);
      if (hasApertmenKey == true) {
        hasApartmenValue.value = false;
      }
      update();
    });
  }

  goToNoRecord() {
    if (box.read('hasApertmen') == false) {
      Get.toNamed('common', arguments: 'noRecordApartment');
    }
  }

  @override
  void onInit() {
    apertmenRecord();
    updateRecordState();
    if (hasApertmenKey == false || hasApertmenKey == null) {
      print(hasApertmenKey);
      hasApartmenValue.value = true;
    }
    box.write('isLogin', true);
    super.onInit();
    tabIndex.value = 2;
  }
}
