// ignore_for_file: avoid_print

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MenuController extends BaseController {
  @override
  RxBool get navBarHide => false.obs;

  @override
  bool? get showBottomSheet => false;

  final listItems = <Widget>[];
  final GlobalKey<AnimatedListState> listKey = GlobalKey();

  void loadItems() {
    final fetchedList = [
      buildMenuItemCard(
        () {
          goToProfileView();
        },
        AppAssets.profile_icon,
        'profile'.tr,
        true,
        appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
      ),
      SizedBox(
        height: 5.h,
      ),
      buildMenuItemCard(
        () {
          Get.toNamed('/profile');
        },
        AppAssets.car_icon,
        'cars'.tr,
        true,
        appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
      ),
      SizedBox(
        height: 5.h,
      ),
      buildMenuItemCard(
        () {
          Get.toNamed('/profile');
        },
        AppAssets.setting_icon,
        'fault'.tr,
        true,
        appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
      ),
      SizedBox(
        height: 5.h,
      ),
      buildMenuItemCard(
        () {
          goToSettingsView();
        },
        AppAssets.option_icon,
        'preferences'.tr,
        true,
        appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
      ),
      SizedBox(
        height: 5.h,
      ),
      buildMenuItemCard(
        () {
          goToAddApartmentView();
        },
        AppAssets.new_add,
        'newApartment'.tr,
        true,
        appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
      ),
      SizedBox(
        height: 5.h,
      ),
      buildMenuItemCard(
        () {
          goToAddStaffView();
        },
        AppAssets.group_icon,
        'managmentTeam'.tr,
        true,
        appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
      ),
      SizedBox(
        height: 5.h,
      ),
      GestureDetector(
        onTap: () {
          clearStorage();
        },
        child: Container(
          width: 350.w,
          height: 40.h,
          color: AppColors.WHITE,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  AppAssets.exit_icon,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'exit'.tr,
                  style:
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.ORANGE),
                ),
              ),
              const Spacer(),
              Visibility(
                visible: false,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AppAssets.arrow_icon),
                ),
              )
            ],
          ),
        ),
      )
    ];

    var future = Future(() {});
    for (var i = 0; i < fetchedList.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 5), () {
          listItems.add(fetchedList[i]);
          listKey.currentState?.insertItem(listItems.length - 1);
        });
      });
    }
  }

  Widget buildMenuItemCard(Function()? onTap, String icon, String menuName,
      bool arrowIconVisible, TextStyle? style) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350.w,
        height: 40.h,
        color: AppColors.WHITE,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(icon),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                menuName,
                style: style,
              ),
            ),
            const Spacer(),
            Visibility(
              visible: arrowIconVisible,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AppAssets.arrow_icon),
              ),
            )
          ],
        ),
      ),
    );
  }

  void goToProfileView() {
    Get.toNamed('profile');
    //Get.toNamed('profile');
  }

  void goToSettingsView() {
    Get.toNamed('preferences');
  }

  void goToAddApartmentView() {
    Get.toNamed('add_apertmen');
  }

  void goToAddStaffView() {
    Get.toNamed('staff');
  }

  void clearStorage() {
    var loginStatus = box.read('isLogin');
    print(loginStatus);
    if (loginStatus == true) {
      box.write('isLogin', false);
      Get.offNamedUntil('splash', (route) => false);
      Get.deleteAll();
    }
    // box.listenKey('isLogin', (newValue) {
    //   //box.write('hasApertmen', newValue);
    //   print(box.read('isLogin'));
    //   var loginStatus = box.read('isLogin');
    //   print(loginStatus);
    //   if (loginStatus == true) {
    //     box.remove('isLogin');
    //     Get.offNamedUntil('splash', (route) => false);
    //   }
    //   update();
    // });
    // box.remove('isLogin');
    // print(box.read('isLogin'));
    // Get.offNamedUntil('splash', (route) => false);
  }

  @override
  void onInit() {
    navBarHide.value = false;
    super.onInit();
    tabIndex.value = 4;
    loadItems();
  }
}
