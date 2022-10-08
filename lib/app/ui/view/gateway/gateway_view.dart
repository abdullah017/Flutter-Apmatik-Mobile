import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/gateway/gateway_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GatewayView extends BaseView<GatewayController> {
  GatewayView({Key? key}) : super(key: key, appBarHide: false);

  @override
  Widget vBuilder() => Padding(
        padding: AppPadding.horizontal20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.15),

            ///[PAYMENT DETAIL CARD]
            buildPaymentDetailCard(),

            const SizedBox(
              height: 30,
            ),

            ///[PAYMENT METHOT BUTTONS]
            Text('payment_methot'.tr,
                style: appTextStyle.getSfProDisplayMedium_H4(AppColors.BLACK)),
            const SizedBox(
              height: 20,
            ),
            buildPaymentMethodButton(
                leading: SvgPicture.asset(AppAssets.card),
                title: 'payment_credit_card'.tr,
                trailing: SvgPicture.asset(AppAssets.back),
                onTap: () {
                  Get.toNamed('/select_card');
                  print('BASTINBASTINBASTIN');
                }),
            const SizedBox(
              height: 10,
            ),
            buildPaymentMethodButton(
              leading: SvgPicture.asset(AppAssets.fly),
              title: 'transfer'.tr,
              trailing: SvgPicture.asset(AppAssets.back),
              onTap: () => Get.toNamed('/money_transfer'),
            ),

            ///[SSL İNFO TEXT]
            Text(
              'ssl'.tr,
              style: appTextStyle
                  .getSfProDisplayRegular_H7(AppColors.GREY)
                  .copyWith(height: 3),
            ),

            ///[CARD IMAGE]
            Image.asset(
              AppAssets.debit,
              width: 54,
              height: 20,
            ),
          ],
        ),
      );

  buildPaymentDetailCard() {
    return Center(
      child: Container(
        width: 350,
        height: 120,
        padding: AppPadding.horizontal12,
        decoration: CustomDecoration.defaultShadow,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 1,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'total_debt'.tr,
                style: appTextStyle
                    .getSfProDisplayMedium(AppColors.BLACK)
                    .copyWith(height: 2),
              ),
              Text.rich(
                TextSpan(
                    text: '2.879,00',
                    style:
                        appTextStyle.getSfProDisplayBold_H5(AppColors.ORANGE),
                    children: [
                      TextSpan(
                        text: ' TL',
                        style: appTextStyle
                            .getSfProDisplayBold_h6(AppColors.ORANGE),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('last_debt_pay'.tr,
                  style: appTextStyle
                      .getSfProDisplayLight_Italic_H6(AppColors.GREY)),
              Text('20/12/2022',
                  style: appTextStyle.getSfProDisplayLight_H5(AppColors.BLACK)),
            ],
          ),
        ),
      ),
    );
  }

  buildPaymentMethodButton(
      {Widget? leading,
      String? title,
      Widget? trailing,
      GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 45,
        decoration: BoxDecoration(boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              3.0, // Move to bottom 10 Vertically
            ),
          )
        ], borderRadius: BorderRadius.circular(5.0), color: Colors.white),
        child: ListTile(
            dense: true,
            minLeadingWidth: 0,
            leading: leading,
            title: Text(title!,
                style: appTextStyle.getSfProDisplayBold_h6(
                  AppColors.ORANGE,
                )),
            trailing: trailing),
      ),
    );
  }
}
