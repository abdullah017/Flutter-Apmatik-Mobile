import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/auth/register/register_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_dropdown_formfield_button.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_page_title.dart';
import 'package:apmatik/app/ui/widgets/custom_inputs/custom_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterView extends BaseView<RegisterController> {
  RegisterView({Key? key})
      : super(key: key, appBarHide: false // false
            );
  @override
  Widget vBuilder() => Form(
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
      padding: EdgeInsets.only(top: 20.0, left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Telefon Numarası',
            style: TextStyle(color: Colors.grey),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 20),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xffE6E6E6)))),
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  top: 10,
                  left: 0,
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: const [
                        Spacer(),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: InternationalPhoneNumberInput(
                    errorMessage: controller.error.value,
                    selectorButtonOnErrorPadding: 0,
                    locale: controller.langStorage == 0 ? 'tr' : 'en',
                    hintText: 'Telefon Numarası',
                    onInputValidated: (bool value) {
                      print(value);
                      if (value == true) {
                        controller.validForm.value = true;
                        controller.showhideErrorMessage.value = false;
                        controller.update();
                      } else {
                        controller.validForm.value = false;
                        controller.showhideErrorMessage.value = true;
                        controller.update();
                      }
                    },
                    validator: (number) {
                      print(number);
                      if (controller.validForm.value == false) {
                        controller.error.value =
                            'Telefon numarası alanını doğru şekilde doldurun!';
                        print(
                            'DOĞRU NO GİRİLMEDİYSE=> ${controller.validForm.value}');
                      } else {
                        controller.validForm.value = true;
                        print(
                            'DOĞRU NO GİRİLDİYSE=> ${controller.validForm.value}');
                      }
                      return null;
                    },
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                      controller.phoneNumberWithRegion = number;
                    },
                    ignoreBlank: false,
                    autoValidateMode: controller.formValidation,
                    selectorTextStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      setSelectorButtonAsPrefixIcon: false,
                      leadingPadding: 0,
                      showFlags: false,
                      trailingSpace: false,
                    ),
                    searchBoxDecoration:
                        InputDecoration(labelText: 'phoneNumberSearchText'.tr),
                    initialValue: PhoneNumber(isoCode: 'TR'),
                    textFieldController: TextEditingController(),
                    formatInput: false,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputDecoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 4, left: 25),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      // labelText: 'Telefon Numarası',
                    ),
                    textStyle: const TextStyle(color: Colors.black),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            replacement: SizedBox.fromSize(
              size: Size(0, 0),
            ),
            visible: controller.showhideErrorMessage.value,
            child: Text(
              controller.error.value,
              style: AppTextStyle().getSfProDisplayRegular_Other(Colors.red),
            ),
          )
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
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          controller.changePasswordShowStatus();
        },
        icon: Icon(
          controller.isPasswordHidden.value
              ? Icons.visibility
              : Icons.visibility_off,
          size: 19.sm,
          color: AppColors.ORANGE,
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
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          controller.changeRePasswordShowStatus();
        },
        icon: Icon(
          controller.isRePasswordHidden.value
              ? Icons.visibility
              : Icons.visibility_off,
          size: 19.sm,
          color: AppColors.ORANGE,
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
