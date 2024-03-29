// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  SplashView({super.key});

  @override
  Widget vBuilder() => Scaffold(
        body: Stack(
          children: [
            buildStaticBackgroundImage(),
            buildSplashLogo(),
          ],
        ),
        floatingActionButton: buildSplashButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // bottomSheet: buildSplashButtons(),
      );

  Container buildStaticBackgroundImage() {
    return Container(
      width: Get.width,
      height: Get.height * 0.7,

      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.jpg'), fit: BoxFit.cover)),
    );
  }

  Positioned buildSplashLogo() {
    return Positioned.fill(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            AppAssets.medium_splash,
            width: 243,
            height: 113,
          )),
    );
  }

  Container buildSplashButtons() {
    return Container(
      width: Get.width,
      height: Get.width > 390 ? Get.height * .15.h : Get.height * .15.h,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomElevatedButton(
            onPressed: () {
              controller.goLoginPage();
            },
            child: Text(
              'loginButton'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(Colors.white),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(const Size(260, 40)),
            ),
            onPressed: () {
              controller.goRegisterPage();
            },
            child: Text('registerTitle'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
          )
        ],
      ),
    );
  }
}
