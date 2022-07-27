// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/apartment/add_apartment/add_apertment_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbar.dart';
import 'package:apmatik/app/ui/widgets/custom_dropdown_formfield_button.dart';
import 'package:apmatik/app/ui/widgets/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_textformfield.dart';
import 'package:apmatik/app/ui/widgets/custom_toggle_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddApertmentView extends BaseView<AddApertmentController> {
  @override
  Widget vBuilder() => Scaffold(
      backgroundColor: AppColors.PAGEBACKGROUND,
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'apartmentRegistration'.tr,
                  style:
                      AppTextStyle().getSfProDisplayMedium_H6(AppColors.BLACK),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'apartmentRegistrationInfo'.tr,
                        textAlign: TextAlign.justify,
                        style: AppTextStyle()
                            .getSfProDisplayRegular_H6(AppColors.BLACK),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Image.asset('assets/images/code.png'))
                  ],
                ),
                CustomElevatedButton(
                  width: 148,
                  height: 30,
                  margin: EdgeInsets.zero,
                  onPressed: () {
                    controller.goQrPage();
                  },
                  child: Text('QR Kodu Okut'),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Form(
            key: controller.addApartmenFormKey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                height: Get.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, left: 5),
                      child: Text(
                        'Sakin Seçimi',
                        style: AppTextStyle()
                            .getSfProDisplayRegular_H5(AppColors.GREY),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: CustomToggleButton(
                          isSelected: controller.isSelected,
                          onPressed: (int newindex) {
                            controller.tabChange(newindex);
                          }),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdownButtonFormField(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          labelText: 'Ülke',
                          value: controller.selectedValue,
                          items: controller.listOfCountry.map((String val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(
                                val,
                                style: AppTextStyle()
                                    .getSfProDisplayMedium_H6(Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                        CustomDropdownButtonFormField(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          labelText: 'İl',
                          value: controller.selectedCity,
                          items: controller.listOfCitys.map((String val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(
                                val,
                                style: AppTextStyle()
                                    .getSfProDisplayMedium_H6(Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                        CustomDropdownButtonFormField(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          labelText: 'İlçe',
                          value: controller.selectedDistrict,
                          items: controller.listOfDistricts.map((String val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(
                                val,
                                style: AppTextStyle()
                                    .getSfProDisplayMedium_H6(Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                        CustomTextFormField(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          labelText: 'Apartman Adı',
                          textEditingController:
                              controller.apartmenNameController,
                          validator: (nameSurname) {
                            return controller.formValidationHelper
                                .apartmenName(nameSurname!);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            '*Lütfen en az 5 karakter giriniz',
                            style: AppTextStyle()
                                .getSfProDisplayLight_H6(Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: CustomElevatedButton(
                              onPressed: () {
                                //01controller.goQrPage();
                              },
                              child: Text('Devam')),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ));
}
