import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:apmatik_app/app/ui/view/auth/additional_details/additional_details_controller.dart';
import 'package:apmatik_app/app/ui/widgets/custom_appbar.dart';
import 'package:apmatik_app/app/ui/widgets/custom_dropdown_formfield_button.dart';
import 'package:apmatik_app/app/ui/widgets/custom_elevated_button.dart';
import 'package:apmatik_app/app/ui/widgets/custom_page_title.dart';
import 'package:apmatik_app/app/ui/widgets/custom_textformfield.dart';
import 'package:apmatik_app/app/ui/widgets/custom_underline_checkbox.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdditionalDetailsView extends BaseView<AdditionalDetailsController> {
  @override
  Widget vBuilder() => SafeArea(
          child: Scaffold(
        appBar: CustomAppBar(),
        body: Form(
          key: controller.additionalFormKey,
          child: ListView(
            children: [
              CustomPageTitle(
                  appTextStyle: appTextStyle,
                  titleText: 'additionalDetails'.tr),
              InkWell(
                  onTap: () {
                    controller.chooseDate();
                  },
                  child: AbsorbPointer(
                      child: CustomTextFormField(
                    textEditingController: controller.dateText,
                    labelText: 'Doğum Tarihi',
                    style: AppTextStyle().getSfProDisplayMedium(Colors.black),
                  ))),
              CustomDropdownButtonFormField(
                labelText: 'maritalStatus'.tr,
                value: controller.selectedValue,
                items: controller.listOfValue.map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                      style: AppTextStyle().getSfProDisplayMedium(Colors.black),
                    ),
                  );
                }).toList(),
              ),
              CustomDropdownButtonFormField(
                labelText: 'childStatus'.tr,
                value: controller.selectedChildValue,
                items: controller.listOfChildValue.map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                      style: AppTextStyle().getSfProDisplayMedium(Colors.black),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                child: Theme(
                  data: ThemeData(
                      textTheme: TextTheme(
                          subtitle1: AppTextStyle()
                              .getSfProDisplayMedium(Colors.black))),
                  child: DropdownSearch<String>(
                    dropdownButtonProps: DropdownButtonProps(
                      padding: EdgeInsets.only(left: 20.w),
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "job".tr,
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                ),
                child: Text(
                  'jobInfo'.tr,
                  style: AppTextStyle().getSfProDisplayLittle(Colors.grey),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomUnderLineCheckBox(
                  value: controller.petCheck.value,
                  onChanged: (Value) {
                    controller.petCheck.value = !controller.petCheck.value;
                    controller.update();
                  },
                  checkBoxText: 'pet'.tr,
                  checkBoxInfoText: 'petInfo'.tr),
              //
              CustomUnderLineCheckBox(
                  value: controller.dontShowCheck.value,
                  onChanged: (Value) {
                    controller.dontShowCheck.value =
                        !controller.dontShowCheck.value;
                    controller.update();
                  },
                  checkBoxText: 'dontShowMeToOtherResidents'.tr,
                  checkBoxInfoText: 'dontShowInfo'.tr),
              Container(
                width: Get.width,
                height: Get.height * .25,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomElevatedButton(
                      onPressed: () {
                        controller.goOtpPage();
                      },
                      child: Text('goOn'.tr),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all<Size>(Size(260, 40)),
                      ),
                      onPressed: () {
                        // controller.goRegisterPage();
                      },
                      child: Text('laterOn'.tr,
                          style: appTextStyle
                              .getSfProDisplayMedium(AppColors.BLACK)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ));
}
