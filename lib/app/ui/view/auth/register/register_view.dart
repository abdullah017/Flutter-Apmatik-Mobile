import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/auth/register/register_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbar.dart';
import 'package:apmatik/app/ui/widgets/custom_dropdown_formfield_button.dart';
import 'package:apmatik/app/ui/widgets/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_page_title.dart';
import 'package:apmatik/app/ui/widgets/custom_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterView extends BaseView<RegisterController> {
  @override
  Widget vBuilder() => Scaffold(
        appBar: CustomAppBar(),
        body: Form(
          key: controller.registerFormKey,
          autovalidateMode: controller.formValidation,
          child: ListView(
            children: [
              buildPageTitle(),
              buildNameSurnameTextField(),
              buildEmailTextField(),
              buildIdentifyNumber(),
              buildPhoneNumber(),
              buildGenderDropdownButton(),
              buildPasswordTextField(),
              buildRePasswordTextField(),
              buildRegisterButton(),
            ],
          ),
        ),
      );

  buildPageTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0.h),
      child: CustomPageTitle(titleText: 'Kaydol'),
    );
  }

  CustomTextFormField buildNameSurnameTextField() {
    return CustomTextFormField(
      labelText: 'nameSurnameLabel'.tr,
      textEditingController: controller.nameSurnameController,
      validator: (nameSurname) {
        return controller.formValidationHelper
            .nameSurnameValidator(nameSurname!);
      },
    );
  }

  CustomTextFormField buildEmailTextField() {
    return CustomTextFormField(
      labelText: 'emailLabel'.tr,
      textEditingController: controller.emailController,
      validator: (email) {
        return controller.formValidationHelper.emailValidator(email!);
      },
    );
  }

  CustomTextFormField buildIdentifyNumber() {
    return CustomTextFormField(
      labelText: 'identifyLabel'.tr,
      textEditingController: controller.identifyNumberController,
      validator: (tc) {
        return controller.formValidationHelper.IdentificationNumber(tc!);
      },
    );
  }

  Padding buildPhoneNumber() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'phoneNumberLabel'.tr,
            style: TextStyle(color: Colors.grey),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 10,
                top: 10,
                left: 10,
                child: Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(
                        CupertinoIcons.chevron_down,
                        size: 11.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: InternationalPhoneNumberInput(
                  selectorButtonOnErrorPadding: 20,
                  spaceBetweenSelectorAndTextField: 12,
                  selectorTextStyle: appTextStyle
                      .getSfProDisplayMedium_little(AppColors.BLACK),
                  validator: (number) {
                    if (number == null) {
                      return 'Lütfen Telefon Numarası alanını doldurun';
                    }
                    if (!controller.correctPhone.value) {
                      return controller.error.value;
                    }
                    return null;
                  },
                  searchBoxDecoration:
                      InputDecoration(hintText: 'searchCountry'.tr),
                  hintText: 'phoneNumberLabel'.tr,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    print(number.dialCode);
                    controller.phoneNumberWithRegion = number;
                  },
                  onInputValidated: (bool value) {
                    print(value);
                    if (!value) {
                      controller.error.value = 'Lütfen numaranızı doğru girin.';
                      controller.correctPhone.value = false;
                    } else {
                      controller.correctPhone.value = true;
                      controller.error.value = '';
                    }
                  },
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    setSelectorButtonAsPrefixIcon: false,
                    leadingPadding: 10,
                    showFlags: false,
                    trailingSpace: true,
                  ),
                  initialValue: PhoneNumber(isoCode: 'TR'),
                  textFieldController: controller.phoneNumberController,
                  formatInput: false,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputDecoration: const InputDecoration(
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.GREY_OPACITY, width: 0.2),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.GREY_OPACITY, width: 0.2),
                    ),

                    //labelText: 'Telefon Numarası',
                  ),
                  textStyle:
                      appTextStyle.getSfProDisplayMedium_H6(AppColors.BLACK),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CustomDropdownButtonFormField buildGenderDropdownButton() {
    return CustomDropdownButtonFormField(
      value: controller.selectedValue,
      items: controller.listOfValue.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
            style: AppTextStyle().getSfProDisplayMedium_H6(Colors.black),
          ),
        );
      }).toList(),
    );
  }

  CustomTextFormField buildPasswordTextField() {
    return CustomTextFormField(
      textEditingController: controller.passwordController,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 1.h),
      labelText: 'password'.tr,
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
        ),
      ),
      validator: (password) {
        return controller.formValidationHelper.passwordValidator(password!);
      },
    );
  }

  CustomTextFormField buildRePasswordTextField() {
    return CustomTextFormField(
      textEditingController: controller.repasswordController,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 1.h),
      labelText: 'rePassword'.tr,
      obscureText: controller.isRePasswordHidden.value,
      obscureCharacter: '*',
      suffixIcon: IconButton(
        onPressed: () {
          controller.changeRePasswordShowStatus();
        },
        icon: Icon(
          controller.isRePasswordHidden.value
              ? Icons.visibility
              : Icons.visibility_off,
          size: 19.sm,
        ),
      ),
      validator: (repassword) {
        return controller.formValidationHelper.rePasswordValidator(
            repassword!, controller.passwordController.text);
      },
    );
  }

  Container buildRegisterButton() {
    return Container(
      width: Get.width,
      height: Get.height * .2,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomElevatedButton(
            fixedSize: Size(330.w, 45.h),
            onPressed: () {
              controller.register();
            },
            child: Text('registerButton'.tr),
          ),
        ],
      ),
    );
  }
}
