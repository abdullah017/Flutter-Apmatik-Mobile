import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/core/constant/asset_constants.dart';
import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashView extends BaseView<SplashController> {
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
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffF7FBFA),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0, 0.9],
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.splashBackground), fit: BoxFit.fill)),
    );
  }

  Positioned buildSplashLogo() {
    return Positioned.fill(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            AppAssets.splashLogo,
            scale: .7,
          )),
    );
  }

  Container buildSplashButtons() {
    return Container(
      width: Get.width,
      height: Get.width > 390 ? Get.height * .15.h : Get.height * .10.h,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomElevatedButton(
            onPressed: () {
              controller.goLoginPage();
            },
            child: Text(
              'loginTitle'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(Colors.white),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(Size(260, 40)),
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
