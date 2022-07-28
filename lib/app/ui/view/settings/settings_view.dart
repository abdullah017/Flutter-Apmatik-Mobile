import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/view/settings/settings_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbar.dart';
import 'package:apmatik/app/ui/widgets/custom_cupertinoswitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsView extends BaseView<SettingsController> {
  @override
  Widget vBuilder() => Scaffold(
      backgroundColor: AppColors.PAGEBACKGROUND,
      appBar: CustomAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        children: [
          buildSettingsCard('Dil ayarları'),
          SizedBox(
            height: 5.h,
          ),
          buildSettingsCard('Dil ayarları'),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Bildirimler',
            ),
          ),
          Container(
            width: 350.w,
            height: 101.h,
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
          buildSettingsCard('Kullanıcı Sözleşmesi'),
          SizedBox(
            height: 5.h,
          ),
          buildSettingsCard('Gizlilik Sözleşmesi'),
          SizedBox(
            height: 5.h,
          ),
          buildSettingsCard('Geri Bildirim'),
          SizedBox(
            height: 5.h,
          ),
          buildSettingsCard('Hakkında'),
        ],
      ));

  buildPaySwitchSettings() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Ödemeler',
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
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sistem',
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
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Avantajlar',
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

  Container buildSettingsCard(String settingName) {
    return Container(
      width: 350.w,
      height: 36.h,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            settingName,
            style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
          ),
          Image.asset(AppAssets.arrow_icon)
        ],
      ),
    );
  }
}
