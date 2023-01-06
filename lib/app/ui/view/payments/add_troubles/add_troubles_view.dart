import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/ui/view/troubles/add_troubles/add_troubles_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_dropdown_formfield_button.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddTroublesView extends BaseView<AddTroublesController> {
  AddTroublesView({Key? key}) : super(key: key, appBarHide: false);

  @override
  Widget vBuilder() => Padding(
        padding: EdgeInsets.only(top: Get.height * 0.02.h, left: 10, right: 10),
        child: ListView(
          children: [
            const Text('Daire Seçiniz'),
            buildSizedBoxHeight10(),
            CustomDropdownButtonFormField(
              padding: EdgeInsets.zero,
              isBordered: true,
              labelText: 'maritalStatus'.tr,
              value: controller.selectApartmenValue,
              items: controller.listOfApartmenName.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                    style:
                        appTextStyle.getSfProDisplayMedium_H6(AppColors.ORANGE),
                  ),
                );
              }).toList(),
            ),
            buildSizedBoxHeight10(),
            const Text('Arıza Seçiniz'),
            buildSizedBoxHeight10(),
            CustomDropdownButtonFormField(
              padding: EdgeInsets.zero,
              isBordered: true,
              labelText: 'maritalStatus'.tr,
              value: controller.selectApartmenValue,
              items: controller.listOfApartmenName.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                    style:
                        appTextStyle.getSfProDisplayMedium_H6(AppColors.ORANGE),
                  ),
                );
              }).toList(),
            ),
            buildSizedBoxHeight10(),
            const Text('Arıza Tanımı'),
            buildSizedBoxHeight10(),
            Container(
              decoration: CustomDecoration.defaultShadow,
              child: TextField(
                style: appTextStyle.getSfProDisplayMedium_H6(AppColors.ORANGE),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomElevatedButton(
              width: 350,
              height: 40,
              onPressed: () {},
              child: const Text(
                'Kaydet',
              ),
            )
          ],
        ),
      );

  SizedBox buildSizedBoxHeight10() {
    return const SizedBox(
      height: 10,
    );
  }
}
