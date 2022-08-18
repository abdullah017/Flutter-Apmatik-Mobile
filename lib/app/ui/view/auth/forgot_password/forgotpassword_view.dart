import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/auth/forgot_password/forgotpassword_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_page_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ForgotPasswordView extends BaseView<ForgotPasswordController> {
  ForgotPasswordView({Key? key})
      : super(key: key, navBarHide: true, appBarHide: false // false
            );
  @override
  Widget vBuilder() => ListView(
        children: [
          buildForm(),
        ],
      );

  Container buildGoOnButton() {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.40.h),
      width: Get.width,
      height: Get.height * 0.05.h,
      child: CustomElevatedButton(
          width: 330,
          height: 45,
          onPressed: () {
            controller.goOtpPage();
          },
          child: Text(
            'goOn'.tr,
            style: appTextStyle.getSfProDisplayMedium_H4(AppColors.WHITE),
          )),
    );
  }

  Form buildForm() {
    return Form(
      key: controller.forgotPasswordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0.h),
            child: CustomPageTitle(titleText: 'forgotPasswordButton'.tr),
          ),
          buildPhoneNumber(),
          buildInfoText(),
          buildGoOnButton(),
          //buildInfoText()
        ],
      ),
    );
  }

  Padding buildPhoneNumber() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Telefon Numarası',
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
                SizedBox(
                  height: 50,
                  child: InternationalPhoneNumberInput(
                    errorMessage: null,
                    hintText: 'Telefon Numarası',
                    onInputValidated: (bool value) {
                      print(value);
                      if (!value) {
                        controller.error!.value =
                            'Telefon numarası alanını doğru şekilde doldurun!';
                        controller.validForm.value = true;
                        print(
                            'DOĞRU NO GİRİLMEDİYSE=> ${controller.validForm.value}');
                        controller.update();
                      } else {
                        controller.error!.value = '';

                        controller.validForm.value = false;
                        print(
                            'DOĞRU NO GİRİLDİYSE=> ${controller.validForm.value}');
                        controller.update();
                      }
                    },
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                      controller.number = number.phoneNumber;
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
                    textFieldController: TextEditingController(),
                    formatInput: false,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputDecoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 4),
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
            visible: controller.validForm.value,
            child: Text(
              controller.error!.value,
              style: AppTextStyle().getSfProDisplayRegular_Other(Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildInfoText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 3.h),
      child: Text(
        'forgostPasswordInfo'.tr,
        style: appTextStyle.getSfProDisplayRegular_H6(AppColors.GREY_OPACITY),
        textAlign: TextAlign.center,
      ),
    );
  }
}
