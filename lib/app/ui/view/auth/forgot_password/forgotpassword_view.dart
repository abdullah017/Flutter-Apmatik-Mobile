import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/view/auth/forgot_password/forgotpassword_controller.dart';
import 'package:apmatik_app/app/ui/widgets/custom_appbar.dart';
import 'package:apmatik_app/app/ui/widgets/custom_elevated_button.dart';
import 'package:apmatik_app/app/ui/widgets/custom_page_title.dart';
import 'package:apmatik_app/app/ui/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends BaseView<ForgotPasswordController> {
  @override
  Widget vBuilder() => SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: buildGoOnButton(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPageTitle(titleText: 'forgotPasswordButton'.tr),
              CustomTextFormField(labelText: 'emailLabel'.tr),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 3.h),
                child: Text(
                  'forgostPasswordInfo'.tr,
                  style: appTextStyle
                      .getSfProDisplayRegular_H6(AppColors.GREY_OPACITY),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      );
  Container buildGoOnButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.w),
      width: Get.width,
      height: Get.height * 0.05.h,
      child: CustomElevatedButton(
          onPressed: () {},
          child: Text(
            'goOn'.tr,
            style: appTextStyle.getSfProDisplayMedium_H4(AppColors.WHITE),
          )),
    );
  }
}
