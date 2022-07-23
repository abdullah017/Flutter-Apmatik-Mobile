// ignore_for_file: must_be_immutable

import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/core/constant/asset_constants.dart';
import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/view/common/common_controller.dart';
import 'package:apmatik_app/app/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonView extends BaseView<CommonController> {
  final IconData? icon;
  final Color? iconColor;
  final String? title;
  final String? subTitle;
  final String? buttonText;
  final bool? buttonShow;
  final bool? logoShow;

  CommonView({
    this.icon,
    this.iconColor,
    this.title,
    this.subTitle,
    this.buttonText,
    this.buttonShow,
    this.logoShow,
    Key? key,
  }) : super(key: key);

  @override
  Widget vBuilder() => Scaffold(
      body: controller.status == 'registerSuccess'
          ? buildRegisterSuccessWidget()
          : controller.status == 'resetPasswordSuccess'
              ? buildResetPasswordSuccessWidget()
              : controller.status == 'noConnection'
                  ? buildNoConnectionWidget()
                  : controller.status == 'oldVersionApp'
                      ? buildOldVersionAppWidget()
                      : controller.status == 'verifyError'
                          ? buildVerifyError()
                          : controller.status == 'noApartmenRecord'
                              ? buildNoApartmenRecord()
                              : controller.status == 'registerApartmentSuccess'
                                  ? buildRegisterApartmentSuccessWidget()
                                  : Container());

  Center buildNoConnectionWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 23.0),
            child: Icon(
              Icons.wifi,
              size: 66,
              color: AppColors.BLACK,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'noConnection'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'noConnectionInfo'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {},
              child: Text('tryAgain'.tr),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 81.0),
            child: Image.asset(AppAssets.statusPageLogo),
          )
        ],
      ),
    );
  }

  Center buildOldVersionAppWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 23.0),
            child: Icon(
              Icons.warning_amber,
              size: 66,
              color: AppColors.BLACK,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'oldAppVersion'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'oldAppVersionInfo'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 81.0),
            child: Image.asset(AppAssets.statusPageLogo),
          )
        ],
      ),
    );
  }

  Center buildVerifyError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 23.0),
            child: Icon(
              Icons.security_update_warning,
              size: 66,
              color: AppColors.BLACK,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'verifyError'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'verifyErrorınfo'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {},
              child: Text('tryAgain'.tr),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('reportProblem'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 81.0),
            child: Image.asset(AppAssets.statusPageLogo),
          )
        ],
      ),
    );
  }

  Center buildNoApartmenRecord() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 23.0),
            child: Icon(
              Icons.apartment_outlined,
              size: 66,
              color: AppColors.BLACK,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'noApertmenRecord'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'noApertmenRecordInfo'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {
                controller.goAddApartment();
              },
              child: Text('noApertmenRecordButton'.tr),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('reportProblem'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 81.0),
            child: Image.asset(AppAssets.statusPageLogo),
          )
        ],
      ),
    );
  }

  Center buildRegisterApartmentSuccessWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 23.0),
            child: Icon(
              Icons.verified_outlined,
              size: 66,
              color: AppColors.BLACK,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'successRecordApartmen'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'successRecordApartmenInfo'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {
                controller.goToHome();
              },
              child: Text('completed'.tr),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 81.0),
            child: Image.asset(AppAssets.statusPageLogo),
          )
        ],
      ),
    );
  }

  Center buildResetPasswordSuccessWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 23.0),
            child: Icon(
              Icons.verified,
              size: 66,
              color: AppColors.ORANGE,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('resetPasswordSuccess'.tr),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('resetPasswordInfo'.tr),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {},
              child: Text(
                'loginButton'.tr,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center buildRegisterSuccessWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 23.0),
            child: Icon(
              Icons.verified,
              size: 66,
              color: AppColors.ORANGE,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('registerSuccess'.tr),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'registerSuccessInfo'.tr,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {
                controller.goLogin();
              },
              child: Text('loginButton'.tr),
            ),
          ),
          Visibility(
            visible: logoShow ?? false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 81.0),
              child: Image.asset(AppAssets.statusPageLogo),
            ),
          )
        ],
      ),
    );
  }
}
