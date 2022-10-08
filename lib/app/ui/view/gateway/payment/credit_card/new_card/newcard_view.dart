// ignore_for_file: must_be_immutable
import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/core/helper/input_formatter/card_date_formatter.dart';
import 'package:apmatik/app/core/utils/credit_card_utils.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/gateway/payment/credit_card/new_card/newcard_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_inputs/custom_filled_textformfield.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NewCardView extends BaseView<NewCardController> {
  NewCardView({super.key});

  @override
  Widget vBuilder() => Form(
        key: controller.newCardFormKey,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.010,
                ),
                buildLabelText(
                  'card_holder'.tr,
                  appTextStyle
                      .getSfProDisplayRegular_H5(AppColors.BLACK)
                      .copyWith(height: 3),
                ),
                SizedBox(
                  height: Get.height * 0.005,
                ),
                buildCardHolderName(),
                SizedBox(
                  height: Get.height * 0.010,
                ),
                buildLabelText('card_number'.tr,
                    appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
                SizedBox(
                  height: Get.height * 0.010,
                ),
                buildCardNumber(),
                SizedBox(
                  height: Get.height * 0.010,
                ),
                buildLabelText('card_expriy_date'.tr,
                    appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
                SizedBox(
                  height: Get.height * 0.010,
                ),
                buildCardExpriyDate(),
                SizedBox(
                  height: Get.height * 0.010,
                ),
                buildLabelText('card_cvv'.tr,
                    appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
                SizedBox(
                  height: Get.height * 0.010,
                ),
                buildCardCvv(),
                SizedBox(
                  height: Get.height * 0.010,
                ),
                buildSaveCardCheck(),
              ],
            ),
          ],
        ),
      );

  CustomFilledTextFormField buildCardHolderName() {
    return CustomFilledTextFormField(
      textEditingController: controller.cardHolderName,
      keyboardType: TextInputType.name,
      style: AppTextStyle().getSfProDisplayRegular_H5(AppColors.ORANGE),
      validator: (cardNumber) =>
          controller.formValidationHelper.nameSurnameValidator(cardNumber!),
    );
  }

  CustomFilledTextFormField buildCardNumber() {
    return CustomFilledTextFormField(
      textEditingController: controller.cardNumber,
      keyboardType: TextInputType.number,
      style: AppTextStyle().getSfProDisplayRegular_H5(AppColors.ORANGE),
      suffix: controller.cardIcon.value.isEmpty
          ? null
          : Image.asset(
              controller.cardIcon.value,
              width: 25,
              height: 15,
              fit: BoxFit.cover,
            ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(19),
        TextInputMask(mask: '9999 9999 9999 9999')
      ],
      onChanged: (value) {
        controller.getCardTypeFrmNumber(value);
        //print(value.replaceAll(' ', ''));
      },
      validator: (cardNumber) =>
          controller.formValidationHelper.creditCardNumber(cardNumber!),
    );
  }

  CustomFilledTextFormField buildCardExpriyDate() {
    return CustomFilledTextFormField(
        textEditingController: controller.cardExpriyDate,
        keyboardType: TextInputType.datetime,
        style: AppTextStyle().getSfProDisplayRegular_H5(AppColors.ORANGE),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(4),
          CardMonthInputFormatter()
        ],
        validator: (date) {
          //controller.formValidationHelper.creditCardNumber(date!);
          return CrediCardUtils.validateDate(date);
        });
  }

  CustomFilledTextFormField buildCardCvv() {
    return CustomFilledTextFormField(
      textEditingController: controller.cardCvvCode,
      keyboardType: TextInputType.number,
      style: AppTextStyle().getSfProDisplayRegular_H5(AppColors.ORANGE),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        // Limit the input
        LengthLimitingTextInputFormatter(4),
      ],
      // validator: (cardNumber) =>
      //     controller.formValidationHelper.creditCardNumber(cardNumber!),
    );
  }

  buildSaveCardCheck() {
    return Padding(
      padding: AppPadding.horizontal9,
      child: CheckboxListTile(
        checkColor: AppColors.WHITE,
        activeColor: AppColors.ORANGE,
        value: controller.checkSaveCard.value,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        //dense: true,
        onChanged: (value) {
          controller.checkSaveCard.value = value!;
          controller.update();
        },
        title: Transform.translate(
            offset: const Offset(-15, 0), child: Text('save_card'.tr)),
      ),
    );
  }

  Align buildLabelText(String labelText, TextStyle? style) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: AppPadding.guideLine,
        child: Text(
          labelText,
          style: style,
        ),
      ),
    );
  }
}
