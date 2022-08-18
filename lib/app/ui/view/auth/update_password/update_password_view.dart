import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/view/auth/update_password/update_password_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_inputs/custom_filled_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpdatePasswordView extends BaseView<UpdatePasswordController> {
  UpdatePasswordView({Key? key})
      : super(key: key, navBarHide: true, appBarHide: false);
  @override
  Widget vBuilder() => Form(
        key: controller.updatePasswordFormKey,
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            buildTextFormField('old_password'.tr, controller.oldPassController,
                (val) {
              return controller.formValidationHelper.passwordValidator(val!);
            }),
            SizedBox(
              height: 5.h,
            ),
            buildTextFormField('new_password'.tr, controller.oldPassController,
                (val) {
              return controller.formValidationHelper.passwordValidator(val!);
            }),
            SizedBox(
              height: 5.h,
            ),
            buildTextFormField(
                're_new_password'.tr, controller.oldPassController, (val) {
              return controller.formValidationHelper
                  .rePasswordValidator(controller.newPassController.text, val!);
            }),
            SizedBox(
              height: 10.h,
            ),
            CustomElevatedButton(
                onPressed: () {
                  controller.updatePassword();
                },
                width: 350.w,
                height: 35.h,
                child: Text('resetPassword'.tr))
          ],
        ),
      );

  buildTextFormField(String hint, TextEditingController controller,
      String? Function(String?)? validator) {
    return Container(
        width: 330.w,
        height: 50.h,
        child: CustomFilledTextFormField(
          hint: hint,
          textEditingController: controller,
          validator: validator,
        ));
  }
}
