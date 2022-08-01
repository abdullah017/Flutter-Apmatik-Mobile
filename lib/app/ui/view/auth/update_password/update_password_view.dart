import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/view/auth/update_password/update_password_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbars/custom_appbar.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePasswordView extends BaseView<UpdatePasswordController> {
  @override
  Widget vBuilder() => Scaffold(
      backgroundColor: AppColors.PAGEBACKGROUND,
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 10.h,
          ),
          buildTextFormField('Eski Şifre', controller.oldPassController, (val) {
            return controller.formValidationHelper.passwordValidator(val!);
          }),
          SizedBox(
            height: 10.h,
          ),
          buildTextFormField('Yeni Şifre', controller.oldPassController, (val) {
            return controller.formValidationHelper.passwordValidator(val!);
          }),
          SizedBox(
            height: 10.h,
          ),
          buildTextFormField('Yeni Şifre Tekrar', controller.oldPassController,
              (val) {
            return controller.formValidationHelper
                .rePasswordValidator(controller.newPassController.text, val!);
          }),
          SizedBox(
            height: 10.h,
          ),
          CustomElevatedButton(
              onPressed: () {},
              width: 350.w,
              height: 35.h,
              child: Text('Şifremi Sıfırla'))
        ],
      ));

  Padding buildTextFormField(String hint, TextEditingController controller,
      String? Function(String?)? validator) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Container(
        width: 330.w,
        height: 30.h,
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            fillColor: AppColors.WHITE,
            hintText: hint,
            hintStyle: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.h),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
