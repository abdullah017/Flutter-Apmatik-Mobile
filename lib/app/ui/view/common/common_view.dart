// ignore_for_file: must_be_immutable

import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/view/common/common_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonView extends BaseView<CommonController> {
  String? status = Get.arguments;
  CommonView({Key? key, this.status}) : super(key: key);

  @override
  Widget vBuilder() => status == "successRegister"
      ? commonPages.statusPage(
          buttonText: 'loginButton'.tr,
          onPressed: () {
            controller.goLogin();
          },
          title: 'Kaydınız Başarıyla Tamamlandı',
          info:
              'Apmatik kaydınız tamamlanmıştır. Hemen muhiti olduğunuz apartmanı ekleyin ve sizde evinizi cebinizden takip edin!',
          icon: Icons.check,
          showLogo: false,
          showIssueButton: false)
      : status == "successResetPassword"
          ? commonPages.statusPage(
              buttonText: 'loginButton'.tr,
              onPressed: () {
                controller.goLogin();
              },
              title: 'resetPasswordSuccess'.tr,
              info: 'resetPasswordInfo'.tr,
              icon: Icons.check,
              showLogo: false,
              showIssueButton: false)
          : status == "connectionFail"
              ? commonPages.statusPage(
                  buttonText: 'tryAgain'.tr,
                  onPressed: () {
                    controller.goLogin();
                  },
                  iconBackgroundColor: Colors.transparent,
                  iconColor: AppColors.BLACK,
                  title: 'noConnection'.tr,
                  info: 'noConnectionInfo'.tr,
                  icon: Icons.wifi,
                  showLogo: true,
                  showIssueButton: false)
              : status == 'oldVersionApp'
                  ? commonPages.statusPage(
                      iconBackgroundColor: Colors.transparent,
                      iconColor: AppColors.BLACK,
                      buttonText: 'updateButton'.tr,
                      onPressed: () {
                        controller.goLogin();
                      },
                      title: 'oldAppVersion'.tr,
                      info: 'oldAppVersionInfo'.tr,
                      icon: Icons.warning_amber_rounded,
                      showLogo: true,
                      showIssueButton: false)
                  : status == 'noApartmenRecord'
                      ? commonPages.statusPage(
                          iconBackgroundColor: Colors.transparent,
                          iconColor: AppColors.BLACK,
                          buttonText: 'tryAgain'.tr,
                          onPressed: () {
                            controller.goLogin();
                          },
                          title: 'verifyError'.tr,
                          info: 'verifyErrorInfo'.tr,
                          icon: Icons.apartment,
                          showLogo: true,
                          showIssueButton: true)
                      : SizedBox();
}
