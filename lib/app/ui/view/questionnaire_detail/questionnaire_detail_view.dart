// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/view/questionnaire_detail/questionnaire_detail_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbars/custom_appbar.dart';
import 'package:apmatik/app/ui/widgets/custom_cards/questionnaire_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QuestionnaireDetailView extends BaseView<QuestionnaireDetailController> {
  @override
  Widget vBuilder() => Scaffold(
      backgroundColor: AppColors.PAGEBACKGROUND,
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          QuestionnaireCardWidget(
            buttonVisible: false,
            margin: EdgeInsets.zero,
            tagVisible: false,
          ),
          Container(
            width: 390.w,
            height: 235.h,
            color: AppColors.WHITE,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Apartmanın Rengi'),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.options.length,
                    itemBuilder: (context, index) {
                      return buildRadioButton(
                          controller.options[index],
                          controller.selectedValue,
                          controller.options[index], (val) {
                        controller.selectedValue = val!;
                        controller.update();
                      });
                    })
              ],
            ),
          ),
          CheckboxListTile(
            checkColor: AppColors.WHITE,
            activeColor: AppColors.ORANGE,
            value: controller.check,
            onChanged: (val) {
              controller.check = val;
              controller.update();
            },
            title: RichText(
              text: TextSpan(
                  text: 'Anket ',
                  children: [
                    TextSpan(
                        text: 'Kurallarını ',
                        style: appTextStyle
                            .getSfProDisplayRegular_H5(AppColors.ORANGE)),
                    TextSpan(text: 'okudum kabul ediyorum'),
                  ],
                  style:
                      appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
            ),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Container(
            width: 350.w,
            height: 35.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextButton(
                child: Text("Anketi Tamamla ",
                    style: appTextStyle
                        .getSfProDisplayRegular_H5(AppColors.ORANGE)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: AppColors.ORANGE),
                    ),
                  ),
                ),
                onPressed: () => null),
          ),
        ],
      ));

  RadioListTile buildRadioButton(dynamic value, dynamic groupValue,
      String? text, Function(dynamic)? onChanged) {
    return RadioListTile(
        dense: true,
        activeColor: Colors.orange,
        value: value ?? controller.selectedValue,
        groupValue: groupValue ?? controller.selectedValue,
        title: Text(
          text ?? 'turkish'.tr,
          style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
        ),
        onChanged: onChanged);
  }
}
