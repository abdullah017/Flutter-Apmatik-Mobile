import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/about/about_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AboutView extends BaseView<AboutController> {
  AboutView({Key? key})
      : super(
          key: key,
          appBarHide: false,
        );
  @override
  Widget vBuilder() => ListView(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Container(
            width: 350.w,
            height: 180.h,
            margin: AppPadding.guideLine,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration:
                BoxDecoration(border: Border.all(color: AppColors.WHITE_GREY)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Notification ID'),
                Text(
                  'sdg234d2f34s2A234SDSD234234',
                  style: appTextStyle
                      .getSfProDisplayBold_h6_other(AppColors.ORANGE),
                ),
                SizedBox(height: 5.h),
                Text('appVersion'.tr),
                Text(
                  'v 1.2.0',
                  style: appTextStyle
                      .getSfProDisplayBold_h6_other(AppColors.ORANGE),
                ),
                SizedBox(height: 5.h),
                Text('userId'.tr),
                Text(
                  '#FFGH345456',
                  style: appTextStyle
                      .getSfProDisplayBold_h6_other(AppColors.ORANGE),
                ),
                SizedBox(height: 5.h),
                Text('contact'.tr),
                Text(
                  'info@apmatik.com',
                  style: appTextStyle
                      .getSfProDisplayBold_h6_other(AppColors.ORANGE),
                ),
              ],
            ),
          ),
        ],
      );
}
