// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/auth/additional_details/additional_details_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_dropdown_formfield_button.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_page_title.dart';
import 'package:apmatik/app/ui/widgets/custom_inputs/custom_textformfield.dart';
import 'package:apmatik/app/ui/widgets/custom_underline_checkbox.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdditionalDetailsView extends BaseView<AdditionalDetailsController> {
  @override
  Widget vBuilder() =>  Form(
          key: controller.additionalFormKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: CustomPageTitle(titleText: 'additionalDetails'.tr),
              ),

              buildBirthDayPicker(),
              buildMaritalStatusDropdown(),
              buildChildDropdown(),
              buildJobsDropdown(),
              buildJobInfoText(),
              SizedBox(
                height: 5.h,
              ),
              buildPetCheckbox(),
              //
              buildDontShowMeToOtherResidentsCheckbox(),
              buildButtons()
            ],
          ),
  );

  InkWell buildBirthDayPicker() {
    return InkWell(
        onTap: () {
          controller.chooseDate();
        },
        child: AbsorbPointer(
            child: CustomTextFormField(
          textEditingController: controller.dateText,
          labelText: 'birtday'.tr,
        )));
  }

  CustomDropdownButtonFormField buildMaritalStatusDropdown() {
    return CustomDropdownButtonFormField(
      labelText: 'maritalStatus'.tr,
      value: controller.selectedValue,
      items: controller.listOfValue.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
            style: AppTextStyle().getSfProDisplayMedium_H6(AppColors.BLACK),
          ),
        );
      }).toList(),
    );
  }

  CustomDropdownButtonFormField buildChildDropdown() {
    return CustomDropdownButtonFormField(
      labelText: 'childStatus'.tr,
      value: controller.selectedChildValue,
      items: controller.listOfChildValue.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
            style: AppTextStyle().getSfProDisplayMedium_H6(AppColors.BLACK),
          ),
        );
      }).toList(),
    );
  }

  Padding buildJobsDropdown() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
      child: Theme(
        data: ThemeData(
            textTheme: TextTheme(
                subtitle1:
                    AppTextStyle().getSfProDisplayMedium_H6(AppColors.BLACK))),
        child: DropdownSearch<String>(
          dropdownButtonProps: DropdownButtonProps(
            padding: EdgeInsets.only(left: 20.w),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "job".tr,
              border: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.GREY_OPACITY, width: 0.2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.GREY_OPACITY, width: 0.2),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.GREY_OPACITY, width: 0.2),
              ),
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
          selectedItem: "Öğrenci",
        ),
      ),
    );
  }

  Padding buildJobInfoText() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
      ),
      child: Text(
        'jobInfo'.tr,
        style: AppTextStyle().getSfProDisplayLight_H6(AppColors.GREY_OPACITY),
      ),
    );
  }

  CustomUnderLineCheckBox buildPetCheckbox() {
    return CustomUnderLineCheckBox(
        value: controller.petCheck.value,
        onChanged: (Value) {
          controller.petCheck.value = !controller.petCheck.value;
          controller.update();
        },
        textOnTap: () {
          controller.petCheck.value = !controller.petCheck.value;
          controller.update();
        },
        checkBoxText: 'pet'.tr,
        checkBoxInfoText: 'petInfo'.tr);
  }

  CustomUnderLineCheckBox buildDontShowMeToOtherResidentsCheckbox() {
    return CustomUnderLineCheckBox(
        value: controller.dontShowCheck.value,
        onChanged: (Value) {
          controller.dontShowCheck.value = !controller.dontShowCheck.value;
          controller.update();
        },
        textOnTap: () {
          controller.dontShowCheck.value = !controller.dontShowCheck.value;
          controller.update();
        },
        checkBoxText: 'dontShowMeToOtherResidents'.tr,
        checkBoxInfoText: 'dontShowInfo'.tr);
  }

  Container buildButtons() {
    return Container(
      width: Get.width,
      height: Get.height * .20,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            fixedSize: Size(330.w, 45.h),
            onPressed: () {
              controller.gostatusPage();
            },
            child: Text('goOn'.tr),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(Size(260, 40)),
            ),
            onPressed: () {
              // controller.goRegisterPage();
            },
            child: Text('laterOn'.tr,
                style: appTextStyle.getSfProDisplayMedium_H4(AppColors.BLACK)),
          )
        ],
      ),
    );
  }
}
