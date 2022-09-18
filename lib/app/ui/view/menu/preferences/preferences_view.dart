import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/menu/preferences/preferences_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_cupertinoswitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PreferencesView extends BaseView<PreferencesController> {
  PreferencesView({Key? key})
      : super(key: key, appBarHide: false // false
            );
  @override
  Widget vBuilder() => ListView(
        padding: AppPadding.horizontal10Vertical90,
        children: [
          buildSettingsCard('languageSettings'.tr, () {
            controller.goToLanguageSettingView();
          }),
          SizedBox(
            height: 5.h,
          ),
          buildSettingsCard('upPassword'.tr, () {
            controller.goToUpdatePasswordView();
          }),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: AppPadding.allPadding8,
            child: Text(
              'notification'.tr,
            ),
          ),
          Container(
            width: 350.w,
            height: 115.h,
            color: Colors.white,
            child: Column(
              children: [
                buildPaySwitchSettings(),
                buildSystemSwitchSettings(),
                buildAdvantageSwitchSettings()
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          buildSettingsCard('userAggrements'.tr, () {
            controller.goToAggrementsView();
          }),
          SizedBox(
            height: 5.h,
          ),
          buildSettingsCard('privateAggrements'.tr, () {
            controller.goToAggrementsView();
          }),
          SizedBox(
            height: 5.h,
          ),
          buildSettingsCard('feedBack'.tr, () {
            controller.goToFeedBackView();
          }),
          SizedBox(
            height: 5.h,
          ),
          buildSettingsCard('about'.tr, () {
            controller.goToAboutView();
          }),
        ],
      );

  buildPaySwitchSettings() {
    return Padding(
      padding: AppPadding.allPadding8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'payments'.tr,
            style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
          ),
          CustomCupertinoSwitch(
              value: controller.paySwitch,
              onChanged: (value) {
                controller.paySwitchChange(value);
              }),
        ],
      ),
    );
  }

  buildSystemSwitchSettings() {
    return Padding(
      padding: AppPadding.allPadding8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'system'.tr,
            style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
          ),
          CustomCupertinoSwitch(
              value: controller.systemSwitch,
              onChanged: (value) {
                controller.systemSwitchChange(value);
              }),
        ],
      ),
    );
  }

  buildAdvantageSwitchSettings() {
    return Padding(
      padding: AppPadding.allPadding8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'advantages'.tr,
            style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
          ),
          CustomCupertinoSwitch(
              value: controller.advantageSwitch,
              onChanged: (value) {
                controller.advantageSwitchChange(value);
              }),
        ],
      ),
    );
  }

  buildSettingsCard(String settingName, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 350.w,
        height: 36.h,
        padding: AppPadding.guideLine,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              settingName,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
            ),
            Image.asset(AppAssets.arrow_icon, color: AppColors.WHITE_GREY)
          ],
        ),
      ),
    );
  }
}
