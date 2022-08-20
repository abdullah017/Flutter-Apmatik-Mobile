import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/auth/otp/otp_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends BaseView<OtpController> {
  OtpView({Key? key})
      : super(key: key,  appBarHide: false // false
            );
  @override
  Widget vBuilder() => Form(
        key: controller.formKey,
        child: ListView(
          children: [
            buildPageTitle(),
            SizedBox(
              height: 38.h,
            ),
            buildPhoneNumberAndInfoText(),
            SizedBox(
              height: 35.h,
            ),
            buildPinCodeTextField(),
            SizedBox(
              height: 21.h,
            ),
            buildTimerCountdown(),
            buildGoOnButton()
          ],
        ),
      );

  Future<dynamic> buildShowModalBottomSheeet() {
    return showModalBottomSheet(
        context: Get.context!,
        builder: (context) {
          return Container(
              width: Get.width,
              height: Get.width > 390 ? Get.height * .20.h : Get.height * .30.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('otpBack'.tr),
                  CustomElevatedButton(
                    onPressed: () {
                      Get.offNamedUntil('splash', (route) => false);
                    },
                    child: Text('goOn'.tr),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.close(0);
                      },
                      child: Text('getBack'.tr))
                ],
              ));
        });
  }

  Container buildGoOnButton() {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.35),
      width: Get.width,
      height: Get.width >= 390 ? Get.height * 0.045.h : Get.height * 0.07.h,
      child: CustomElevatedButton(
          onPressed: () {
            controller.gosAdditionalPage();
          },
          child: Text(
            'goOn'.tr,
            style: appTextStyle.getSfProDisplayMedium_H4(AppColors.WHITE),
          )),
    );
  }

  buildPageTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0.h),
      child: CustomPageTitle(titleText: 'verificationCode'.tr),
    );
  }

  Center buildPhoneNumberAndInfoText() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: '${controller.phone}\n\n',
          style: AppTextStyle().getSfProDisplayBold_h6(Colors.black),
          children: [
            TextSpan(
                text: 'verificationCodeInfo'.tr,
                style: AppTextStyle()
                    .getSfProDisplayRegular_H5(AppColors.GREY_OPACITY)),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Padding buildPinCodeTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: PinCodeTextField(
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          focusNode: controller.myFocusNode,
          autoDisposeControllers: false,
          autoFocus: true,
          autoUnfocus: false,
          pinTheme: PinTheme(
              inactiveColor: Colors.grey.shade300, //inactive border side
              inactiveFillColor: AppColors.WHITE_OPACITY,

              ///inactive background
              activeColor: Colors.white,
              activeFillColor: AppColors.ORANGE,
              selectedColor: AppColors.ORANGE,
              selectedFillColor: AppColors.ORANGE,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              fieldOuterPadding: EdgeInsets.all(3)),
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          errorAnimationController: controller.errorController,
          controller: controller.textEditingController,
          validator: (value) {
            if (value == null || value.length < 6) {
              print(value);
              controller.hasError.value = true;

              return "";
            } else {
              return null;
            }
          },
          onCompleted: (v) {
            print("Completed");
            controller.myFocusNode;
          },
          onChanged: (value) {
            print(value);

            controller.currentText.value = value;
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
          appContext: Get.context!),
    );
  }

  Row buildTimerCountdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimerCountdown(
          enableDescriptions: false,
          format: CountDownTimerFormat.minutesSeconds,
          endTime: DateTime.now().add(
            Duration(
              minutes: 2,
              seconds: 00,
            ),
          ),
          onEnd: () {
            print("Timer finished");
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'verificationTimer'.tr,
            style: AppTextStyle()
                .getSfProDisplayRegular_H6(AppColors.GREY_OPACITY),
          ),
        )
      ],
    );
  }
}
