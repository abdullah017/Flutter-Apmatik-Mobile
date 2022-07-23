// ignore_for_file: must_be_immutable

import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/core/constant/color_constants.dart';

import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:apmatik_app/app/ui/view/apartment/select_apartment/select_apartment_controller.dart';

import 'package:apmatik_app/app/ui/widgets/custom_appbar.dart';
import 'package:apmatik_app/app/ui/widgets/select_apartment_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectApartmentView extends BaseView<SelectApartmentController> {
  @override
  Widget vBuilder() => Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.PAGEBACKGROUND,
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
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: SelectApartmentCard(
                    onPressed: () {
                      controller.goCommonPage();
                    },
                  ),
                );
              })),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Text(
                'Apartmanınızı bu listede bulamıyorsanız lütfen apartman yöneticiniz ile iletişime geçiniz.'),
          )
        ],
      ));
}
