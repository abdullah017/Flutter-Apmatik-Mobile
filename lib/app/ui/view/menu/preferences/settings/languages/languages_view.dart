import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/languages/languages_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagesView extends BaseView<LanguagesController> {
  LanguagesView({Key? key})
      : super(
          key: key,
          appBarHide: false,
        );
  @override
  Widget vBuilder() => Padding(
        padding: AppPadding.horizontal10Vertical15,
        child: ListView(
          children: [
           Container(
             decoration: CustomDecoration.defaultShadow,
             child:  RadioListTile<int>(
               contentPadding: const EdgeInsets.only(left: 10, right: 10),
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
           const SizedBox(
              height: 5,
            ),
            Container(
              decoration: CustomDecoration.defaultShadow,
              child: RadioListTile<int>(
                contentPadding: const EdgeInsets.only(left: 10, right: 10),
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
