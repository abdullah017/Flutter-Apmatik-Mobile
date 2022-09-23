import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/problem_report/report_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportView extends BaseView<ReportController> {
  ReportView({Key? key})
      : super(
          key: key,
          appBarHide: false,
        );
  @override
  Widget vBuilder() => Form(
        key: controller.reportFormKey,
        child: ListView(
          padding: AppPadding.horizontal10Vertical90,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Text(
              'nameSurname'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 330.w,
              height: 30.h,
              child: TextFormField(
                controller: controller.nameSurnameController,
                validator: (val) {
                  return controller.formValidationHelper
                      .nameSurnameValidator(val!);
                },
                decoration: InputDecoration(
                  fillColor: AppColors.WHITE,
                  //hintText: 'Hasan Turan',
                  hintStyle:
                      appTextStyle.getSfProDisplayRegular_H5(AppColors.ORANGE),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0.h, horizontal: 10.0.h),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'causeProblem'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
            ),
            SizedBox(
              height: 5.h,
            ),
            Theme(
              data: ThemeData(
                  textTheme: TextTheme(
                      subtitle1: appTextStyle
                          .getSfProDisplayMedium_H6(AppColors.ORANGE))),
              child: SizedBox(
                width: 330.w,
                height: 30.h,
                child: DropdownSearch<String>(
                  dropdownButtonProps: DropdownButtonProps(
                    padding: EdgeInsets.only(left: 20.w),
                  ),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
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
            SizedBox(
              height: 15.h,
            ),
            Text(
              'description'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 330.w,
              height: 137.h,
              child: TextFormField(
                controller: controller.descriptionController,
                validator: (val) {
                  return null;
                },
                maxLines: 9,
                style: appTextStyle.getSfProDisplayRegular_H6(AppColors.BLACK),
                decoration: InputDecoration(
                  fillColor: AppColors.WHITE,
                  //hintText: 'Hasan Turan',
                  hintStyle:
                      appTextStyle.getSfProDisplayRegular_H5(AppColors.ORANGE),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0.h, horizontal: 10.0.h),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
              ),
            ),
            CustomElevatedButton(
                onPressed: () {}, child: Text('send_button'.tr))
          ],
        ),
      );
}
