// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/settings/languages/languages_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbars/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanguagesView extends BaseView<LanguagesController> {
      LanguagesView({Key? key})
      : super(
          key: key,
          navBarHide: true, // false
        );
  @override
  Widget vBuilder() => Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.h),
        child: ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.PAGEBACKGROUND, width: 2)),
              elevation: 0,
              color: Colors.transparent,
              borderOnForeground: true,
              child: RadioListTile<int>(
                activeColor: Colors.orange,
                value: 0,
                groupValue: controller.selectedValue,
                title: Text(
                  'turkish'.tr,
                  style:
                      AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
                ),
                onChanged: (value) {
                  controller.selectTR(value);
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.PAGEBACKGROUND, width: 2)),
              elevation: 0,
              color: Colors.transparent,
              borderOnForeground: true,
              child: RadioListTile<int>(
                activeColor: Colors.orange,
                value: 1,
                groupValue: controller.selectedValue,
                title: Text(
                  'english'.tr,
                  style:
                      AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
                ),
                onChanged: (value) {
                  controller.selectUS(value);
                },
              ),
            ),
          ],
        ),
      ));
}
