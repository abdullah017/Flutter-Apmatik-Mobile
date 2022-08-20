// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MenuView extends BaseView<MenuController> {
  MenuView({Key? key}) : super(key: key, appBarHide: false);

  @override
  Widget vBuilder() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0.w,
        ),
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.only(top: 20.h),
                width: 350.w,
                height:
                    Get.width > 390 ? Get.height * 0.90.h : Get.height * 0.50.h,
                child: Column(
                  children: [
                    buildMenuItemCard(
                      () {
                        controller.goToProfileView();
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
                        controller.goToSettingsView();
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
                        controller.goToAddApartmentView();
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
                        controller.goToAddStaffView();
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
                        controller.clearStorage();
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
                                style: appTextStyle.getSfProDisplaySemiBold_h6(
                                    AppColors.ORANGE),
                              ),
                            ),
                            Spacer(),
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
                  ],
                )),
            Padding(
              padding: Get.width == 390
                  ? EdgeInsets.symmetric(
                      vertical: 25.0.h,
                    )
                  : EdgeInsets.symmetric(vertical: 85.0.h),
              child: Container(
                width: 350.w,
                height: 75.h,
                color: Colors.transparent,
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      'Eşşiz Apmatik Kampanyalarına Hemen Katıl',
                      style: AppTextStyle()
                          .getSfProDisplaySemiBold_h6(AppColors.ORANGE),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text('Eşşiz Apmatik Kampanyalarına Hemen Katıl',
                          style: AppTextStyle()
                              .getSfProDisplayRegular_H6(AppColors.DARK_GREY)),
                    ),
                    trailing: Image.asset(AppAssets.gift_icon),
                  ),
                ),
              ),
            )
          ],
        ),
      );

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
            Spacer(),
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
}
