import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/apartment/add_apartment/add_apertment_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_dropdown_formfield_button.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_inputs/custom_textformfield.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_toggle_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddApertmentView extends BaseView<AddApertmentController> {
  AddApertmentView({Key? key})
      : super(key: key, appBarHide: true // false
            );
  @override
  Widget vBuilder() => ListView(
        children: [
          Container(
            color: AppColors.WHITE,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: buildReadQrArea(),
          ),
          buildManualApartmentArea()
        ],
      );

  Form buildManualApartmentArea() {
    return Form(
      key: controller.addApartmenFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          padding: EdgeInsets.all(5.0.sm),
          width: 250.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10.h, left: 10.w),
                child: Text(
                  'resident_status'.tr,
                  style:
                      AppTextStyle().getSfProDisplayRegular_H5(AppColors.GREY),
                ),
              ),
              buildToggleTabButton(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCountry(),
                  buildCity(),
                  buildDistrict(),
                  buildApartmentName(),
                  buildApartmentInfoText(),
                  buildGoOnButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildReadQrArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          'apartmentRegistration'.tr,
          style: AppTextStyle().getSfProDisplayMedium_H6(AppColors.BLACK),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [buildQrInfoText(), buildQrImage()],
        ),
        buildReadQrButton(),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  Flexible buildQrInfoText() {
    return Flexible(
      child: Text(
        'apartmentRegistrationInfo'.tr,
        textAlign: TextAlign.justify,
        style: AppTextStyle().getSfProDisplayRegular_H6(AppColors.BLACK),
      ),
    );
  }

  Container buildQrImage() {
    return Container(
        margin: const EdgeInsets.only(left: 20),
        child: SvgPicture.asset(AppAssets.qr_icon));
  }

  CustomElevatedButton buildReadQrButton() {
    return CustomElevatedButton(
      width: 148.w,
      height: 30.h,
      margin: EdgeInsets.zero,
      onPressed: () {
        controller.goQrPage();
      },
      child: Text('readQr'.tr),
    );
  }

  buildToggleTabButton() {
    return Padding(
      padding: AppPadding.guideLine,
      child: CustomToggleButton(
          isSelected: controller.isSelected,
          onPressed: (int newindex) {
            controller.tabChange(newindex);
          }),
    );
  }

  CustomDropdownButtonFormField buildCountry() {
    return CustomDropdownButtonFormField(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      labelText: 'country'.tr,
      labelTextStyle: appTextStyle.getSfProDisplayRegular_H5(AppColors.GREY),
      value: controller.selectedValue,
      items: controller.listOfCountry.map((String val) {
        return DropdownMenuItem(
          alignment: Alignment.centerLeft,
          value: val,
          child: Text(
            val,
            style: AppTextStyle().getSfProDisplayMedium_H6(Colors.black),
          ),
        );
      }).toList(),
    );
  }

  CustomDropdownButtonFormField buildCity() {
    return CustomDropdownButtonFormField(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      labelText: 'city'.tr,
      value: controller.selectedCity,
      items: controller.listOfCitys.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
            style: AppTextStyle().getSfProDisplayMedium_H6(Colors.black),
          ),
        );
      }).toList(),
    );
  }

  CustomDropdownButtonFormField buildDistrict() {
    return CustomDropdownButtonFormField(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      labelText: 'district'.tr,
      value: controller.selectedDistrict,
      items: controller.listOfDistricts.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
            style: AppTextStyle().getSfProDisplayMedium_H6(Colors.black),
          ),
        );
      }).toList(),
    );
  }

  CustomTextFormField buildApartmentName() {
    return CustomTextFormField(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      labelText: 'aparment_name'.tr,
      textEditingController: controller.apartmenNameController,
      validator: (nameSurname) {
        return controller.formValidationHelper.apartmenName(nameSurname!);
      },
    );
  }

  Padding buildApartmentInfoText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        'apartment_name_info'.tr,
        style: AppTextStyle().getSfProDisplayLight_H6(Colors.black),
      ),
    );
  }

  Padding buildGoOnButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: CustomElevatedButton(
          width: 350,
          height: 35,
          onPressed: () {
            controller.goManualSearchResult();
          },
          child: Text('go'.tr)),
    );
  }
}
