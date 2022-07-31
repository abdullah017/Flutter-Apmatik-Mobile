// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/view/problem_report/report_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbar.dart';
import 'package:apmatik/app/ui/widgets/custom_elevated_button.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportView extends BaseView<ReportController> {
  @override
  Widget vBuilder() => Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.PAGEBACKGROUND,
      body: Form(
        key: controller.reportFormKey,
        child: ListView(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.h),
              child: Text(
                'nameSurname'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Container(
                width: 330.w,
                height: 30.h,
                child: TextFormField(
                  controller: TextEditingController(),
                  validator: (val) {
                    return controller.formValidationHelper
                        .nameSurnameValidator(val!);
                  },
                  decoration: InputDecoration(
                    fillColor: AppColors.WHITE,
                    //hintText: 'Hasan Turan',
                    hintStyle: appTextStyle
                        .getSfProDisplayRegular_H5(AppColors.ORANGE),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 10.0.h),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.h),
              child: Text(
                'causeProblem'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Theme(
                data: ThemeData(
                    textTheme: TextTheme(
                        subtitle1: appTextStyle
                            .getSfProDisplayMedium_H6(AppColors.ORANGE))),
                child: Container(
                  width: 330.w,
                  height: 30.h,
                  child: DropdownSearch<String>(
                    dropdownButtonProps: DropdownButtonProps(
                      padding: EdgeInsets.only(left: 20.w),
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: controller.joblist,
                    onChanged: print,
                    //show selected item
                    selectedItem: "Uygulama",
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.h),
              child: Text(
                'description'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Container(
                width: 330.w,
                height: 137.h,
                child: TextFormField(
                  controller: TextEditingController(),
                  validator: (val) {},
                  maxLines: 9,
                  style:
                      appTextStyle.getSfProDisplayRegular_H6(AppColors.BLACK),
                  decoration: InputDecoration(
                    fillColor: AppColors.WHITE,
                    //hintText: 'Hasan Turan',
                    hintStyle: appTextStyle
                        .getSfProDisplayRegular_H5(AppColors.ORANGE),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 10.0.h),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                ),
              ),
            ),
            CustomElevatedButton(onPressed: () {}, child: Text('Gönder'))
          ],
        ),
      ));
}
