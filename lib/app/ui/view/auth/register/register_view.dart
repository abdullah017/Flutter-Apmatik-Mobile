import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:apmatik_app/app/ui/view/auth/register/register_controller.dart';
import 'package:apmatik_app/app/ui/widgets/custom_appbar.dart';
import 'package:apmatik_app/app/ui/widgets/custom_dropdown_formfield_button.dart';
import 'package:apmatik_app/app/ui/widgets/custom_elevated_button.dart';
import 'package:apmatik_app/app/ui/widgets/custom_page_title.dart';
import 'package:apmatik_app/app/ui/widgets/custom_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterView extends BaseView<RegisterController> {
  @override
  Widget vBuilder() => SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(),
          body: Form(
            key: controller.registerFormKey,
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
        ),
      );

  CustomPageTitle buildPageTitle() {
    return CustomPageTitle(appTextStyle: appTextStyle, titleText: 'Kaydol');
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
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'phoneNumberLabel'.tr,
            style: TextStyle(color: Colors.grey),
          ),
          Container(
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.grey))),
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
                //NUMARA MASKELEME İŞLEMİ YAPILACAK
                SizedBox(
                  height: 50,
                  child: InternationalPhoneNumberInput(
                    validator: (number) {
                      // return controller.formValidationHelper
                      //     .phoneNumberValidator(number!);
                      if (number == null) {
                        return 'Lütfen Telefon Numarası alanını doldurun';
                      }
                      if (!controller.correctPhone.value) {
                        return controller.error.value;
                      }
                    },
                    searchBoxDecoration:
                        InputDecoration(hintText: 'searchCountry'.tr),
                    spaceBetweenSelectorAndTextField: 0,
                    hintText: 'phoneNumberLabel'.tr,
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                      print(number.dialCode);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                      if (!value) {
                        controller.error.value =
                            'Telefon numarası alanını doğru şekilde doldurun!';
                        controller.correctPhone.value = false;
                      } else {
                        controller.correctPhone.value = true;
                        controller.error.value = '';
                      }
                    },
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.always,
                    selectorTextStyle: const TextStyle(
                      color: Colors.black,
                    ),
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
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),

                      //labelText: 'Telefon Numarası',
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
            style: AppTextStyle().getSfProDisplayMedium(Colors.black),
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
      style: appTextStyle.getSfProDisplayMedium(Colors.black),
      obscureText: controller.isPasswordHidden.value,
      obscureCharacter: '*',
      suffixIcon: IconButton(
          onPressed: () {
            controller.changePasswordShowStatus();
          },
          icon: Icon(controller.isPasswordHidden.value
              ? Icons.visibility
              : Icons.visibility_off)),
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
      style: appTextStyle.getSfProDisplayMedium(Colors.black),
      obscureText: controller.isRePasswordHidden.value,
      obscureCharacter: '*',
      suffixIcon: IconButton(
          onPressed: () {
            controller.changeRePasswordShowStatus();
          },
          icon: Icon(controller.isRePasswordHidden.value
              ? Icons.visibility
              : Icons.visibility_off)),
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
            onPressed: () {
              controller.register();
              controller.getRegionPhoneNumber();
            },
            child: Text('registerButton'.tr),
          ),
        ],
      ),
    );
  }
}
