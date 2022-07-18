import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/core/constant/color_constants.dart';

import 'package:apmatik_app/app/ui/view/auth/login/login_controller.dart';
import 'package:apmatik_app/app/ui/widgets/custom_appbar.dart';
import 'package:apmatik_app/app/ui/widgets/custom_elevated_button.dart';
import 'package:apmatik_app/app/ui/widgets/custom_page_title.dart';
import 'package:apmatik_app/app/ui/widgets/custom_textformfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends BaseView<LoginController> {
  @override
  Widget vBuilder() => Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          children: [
            Form(
              key: controller.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0.h),
                    child: buildPageTitle(),
                  ),
                  buildEMailField(),
                  buildPasswordField(),
                  SizedBox(
                    height: 45.h,
                  ),
                  buildButtonsCapsule(),
                ],
              ),
            ),
          ],
        ),
      );

  CustomPageTitle buildPageTitle() {
    return CustomPageTitle(titleText: 'loginTitle'.tr);
  }

  CustomTextFormField buildEMailField() {
    return CustomTextFormField(
      textEditingController: controller.emailController,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
      labelText: 'emailLabel'.tr,
      validator: (email) {
        return controller.formValidationHelper.emailValidator(email!);
      },
    );
  }

  CustomTextFormField buildPasswordField() {
    return CustomTextFormField(
      textEditingController: controller.passwordController,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 1.h),
      labelText: 'passowordLabel'.tr,
      obscureText: controller.isPasswordHidden.value,
      obscureCharacter: '*',
      suffixIcon: IconButton(
          onPressed: () {
            controller.changePasswordShowStatus();
          },
          icon: Icon(
            controller.isPasswordHidden.value
                ? Icons.visibility
                : Icons.visibility_off,
            size: 19.sm,
          )),
      validator: (password) {
        return controller.formValidationHelper.passwordValidator(password!);
      },
    );
  }

  Container buildButtonsCapsule() {
    return Container(
      width: Get.width,
      height: Get.height * .25,
      color: Colors.transparent,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildLoginButton(),
          SizedBox(
            height: 10.h,
          ),
          buildForgotPasswordButton()
        ],
      ),
    );
  }

  CustomElevatedButton buildLoginButton() {
    return CustomElevatedButton(
      buttonSize: Size(330.w, 45.h),
      onPressed: () {
        controller.login();
      },
      child: Text(
        'loginButton'.tr,
        style: appTextStyle.getSfProDisplayRegular_H5(AppColors.WHITE),
      ),
    );
  }

  TextButton buildForgotPasswordButton() {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size(260.w, 40.h)),
      ),
      onPressed: () {
        controller.goToForgotPassword();
      },
      child: Text(
        'forgotPasswordButton'.tr,
        style: appTextStyle.getSfProDisplayRegular_H6(AppColors.GREY_OPACITY),
      ),
    );
  }
}
