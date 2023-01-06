import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/money_transfer/money_transfer_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_bottom_payment_button_widget.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_dropdown_formfield_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MoneyTransferView extends BaseView<MoneyTransferController> {
  MoneyTransferView({Key? key}) : super(key: key, appBarHide: false);

  @override
  Widget vBuilder() => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: Get.height * 0.050,
                ),
                buildLabelText(
                  'Banka Seçiniz',
                  appTextStyle.getSfProDisplayRegular_H5(
                    AppColors.BLACK,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDropdownButtonFormField(
                  padding: AppPadding.guideLine,
                  isBordered: true,
                  value: 'Ziraat Bankası',
                  items: controller.listOfBank.map((String val) {
                    return DropdownMenuItem(
                      alignment: Alignment.centerLeft,
                      value: val,
                      child: Text(
                        val,
                        style: appTextStyle
                            .getSfProDisplayMedium_H6(AppColors.ORANGE),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 360,
                  decoration: CustomDecoration.defaultShadow,
                  padding: AppPadding.onlyLeftRightTop,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppAssets.ziraat,
                        width: 90,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Hesap Adı',
                          style: appTextStyle
                              .getSfProDisplayRegular_H5(AppColors.DARK_GREY),
                        ),
                        subtitle: Text(
                          'Apmatik Anonim Limited',
                          style: appTextStyle.getSfProDisplayBold_h6(
                            AppColors.ORANGE,
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Banka Hesap Numarası',
                          style: appTextStyle
                              .getSfProDisplayRegular_H5(AppColors.DARK_GREY),
                        ),
                        subtitle: Text(
                          controller.iban.value,
                          style: appTextStyle.getSfProDisplayBold_h6(
                            AppColors.ORANGE,
                          ),
                        ),
                        trailing: IconButton(
                            alignment: Alignment.bottomCenter,
                            onPressed: () => controller
                                .copyToClipboard(controller.iban.value),
                            icon: SvgPicture.asset(AppAssets.copy)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 360,
                  decoration: CustomDecoration.defaultShadow,
                  padding: AppPadding.onlyLeftRightTop,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        dense: true,
                        isThreeLine: true,
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 10,
                        title: Text(
                          'Açıklama Kodu',
                          style: appTextStyle
                              .getSfProDisplayRegular_H5(AppColors.DARK_GREY),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                  text: controller.descValue.value,
                                  style: appTextStyle
                                      .getSfProDisplayBold_h6(
                                        AppColors.ORANGE,
                                      )
                                      .copyWith(
                                        letterSpacing: 3,
                                      ),
                                  children: [
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: IconButton(
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.center,
                                          onPressed: () =>
                                              controller.copyToClipboard(
                                                  controller.descValue.value),
                                          icon:
                                              SvgPicture.asset(AppAssets.copy)),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text:
                                      'Bu kodu hesap transferi yaparken açıklama kısmına yazınız. Açıklaması boş olan transferler hesabınıza',
                                  children: [
                                    TextSpan(
                                      text: ' iade edilecektir.',
                                      style: appTextStyle
                                          .getSfProDisplayLight_H6_Bold(
                                        AppColors.BLACK,
                                      ),
                                    )
                                  ]),
                              style: appTextStyle.getSfProDisplayLight_H6(
                                AppColors.BLACK,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            CustomBottomPaymentButton(
              onPressed: () {
                controller.navigateSuccessPage();
              },
            ),
          ],
        ),
      );
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
