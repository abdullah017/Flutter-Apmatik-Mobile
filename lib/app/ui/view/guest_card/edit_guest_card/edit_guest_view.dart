import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/view/guest_card/edit_guest_card/edit_guest_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_toggle_button.dart';
import 'package:apmatik/app/ui/widgets/custom_inputs/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditGuestCardView extends BaseView<EditGuestCardController> {
  EditGuestCardView({Key? key}) : super(key: key, appBarHide: false);

  @override
  Widget vBuilder() => Padding(
        padding: EdgeInsets.only(top: Get.height * 0.09.h, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildSizedBoxHeight10(),
            Text(
              'Kod Geçerli Olsun',
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.GREY),
            ),
            SizedBox(
              height: 3.h,
            ),
            buildToggleTabButton(),
            buildSizedBoxHeight10(),
            Text(
              '*Kodun geçerlilik süresi tamamlandığında otomatik olarak silinecektir',
              style: appTextStyle.getSfProDisplayRegular_H6(AppColors.GREY),
            ),
            buildSizedBoxHeight10(),
            Form(key: controller.guestCardFormKey, child: buildName()),
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
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Giriş Kartını Sil',
                  style: appTextStyle.getSfProDisplayRegular_H5(AppColors.RED),
                ),
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

  CustomTextFormField buildName() {
    return CustomTextFormField(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      labelText: 'Kodun Sahibi',
      textEditingController: controller.nameController,
      validator: (nameSurname) {
        return controller.formValidationHelper
            .nameSurnameValidator(nameSurname!);
      },
    );
  }

  buildToggleTabButton() {
    return CustomToggleButton(
        isSelected: controller.isSelected,
        newChildren: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: const Text('1 Gün', style: TextStyle(fontSize: 12)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: const Text('1 Hafta', style: TextStyle(fontSize: 12)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: const Text('1 Ay', style: TextStyle(fontSize: 12)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: const Text('3 Ay', style: TextStyle(fontSize: 12)),
          ),
        ],
        onPressed: (int newindex) {
          controller.tabChange(newindex);
        });
  }
}
