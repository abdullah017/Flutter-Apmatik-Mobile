// ignore_for_file: must_be_immutable

import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/core/constant/asset_constants.dart';
import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:apmatik_app/app/ui/view/menu/menu_controller.dart';
import 'package:apmatik_app/app/ui/widgets/login_appbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MenuView extends BaseView<MenuController> {
  @override
  Widget vBuilder() => Scaffold(
      backgroundColor: AppColors.PAGEBACKGROUND,
      appBar: CustomLoginUserAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
        child: ListView(
          children: [
            Container(
                width: 350.w,
                height:
                    Get.width > 390 ? Get.height * 0.50.h : Get.height * 0.75.h,
                child: Column(
                  children: [
                    buildMenuItemCard(
                      () {},
                      AppAssets.profile_icon,
                      'profile'.tr,
                      true,
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
                    ),
                    buildMenuItemCard(
                      () {},
                      AppAssets.car_icon,
                      'cars'.tr,
                      true,
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
                    ),
                    buildMenuItemCard(
                      () {},
                      AppAssets.setting_icon,
                      'fault'.tr,
                      true,
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
                    ),
                    buildMenuItemCard(
                      () {},
                      AppAssets.option_icon,
                      'preferences'.tr,
                      true,
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
                    ),
                    buildMenuItemCard(
                      () {},
                      AppAssets.new_add,
                      'newApartment'.tr,
                      true,
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
                    ),
                    buildMenuItemCard(
                      () {},
                      AppAssets.group_icon,
                      'managmentTeam'.tr,
                      true,
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
                    ),
                    buildMenuItemCard(
                      () {},
                      AppAssets.exit_icon,
                      'exit'.tr,
                      false,
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.ORANGE),
                    ),
                  ],
                )),
            Container(
              width: 350.w,
              height: 75.h,
              color: AppColors.WHITE,
              child: Card(
                elevation: 5,
                child: ListTile(
                  dense: true,
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
            )
          ],
        ),
      ));

  Widget buildMenuItemCard(Function()? onTap, String icon, String menuName,
      bool arrowIconVisible, TextStyle? style) {
    return InkWell(
      onTap: () {},
      child: Card(
          child: ListTile(
        leading: Image.asset(
          icon,
          width: 16,
          height: 16,
        ),
        title: Text(
          menuName,
          style: style,
        ),
        trailing: Visibility(
            visible: arrowIconVisible,
            child: Image.asset(AppAssets.arrow_icon)),
      )),
    );
  }
}
