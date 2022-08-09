import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';

import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/apartment/select_apartment/select_apartment_controller.dart';

import 'package:apmatik/app/ui/widgets/custom_appbars/custom_appbar.dart';
import 'package:apmatik/app/ui/widgets/custom_cards/select_apartment_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectApartmentView extends BaseView<SelectApartmentController> {
  @override
  Widget vBuilder() => Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.PAGEBACKGROUND,
      body: ListView(
        children: [
          Container(
            color: AppColors.WHITE,
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
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
                  height: 20.h,
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
          buildInfoText()
        ],
      ));

  Padding buildInfoText() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Text('select_apartment_info'.tr),
    );
  }
}
