import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/languages/languages_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanguagesView extends BaseView<LanguagesController> {
  LanguagesView({Key? key})
      : super(
          key: key,
          appBarHide: false,
        );
  @override
  Widget vBuilder() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.h),
        child: ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.WHITE_GREY, width: 1)),
              elevation: 0,
              color: Colors.transparent,
              borderOnForeground: true,
              child: RadioListTile<int>(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                dense: true,
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
                  side: BorderSide(color: AppColors.WHITE_GREY, width: 1)),
              elevation: 0,
              color: Colors.transparent,
              borderOnForeground: true,
              child: RadioListTile<int>(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                dense: true,
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
      );
}
