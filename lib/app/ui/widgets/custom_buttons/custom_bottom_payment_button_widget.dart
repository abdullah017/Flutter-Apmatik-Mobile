import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomPaymentButton extends StatelessWidget {
  const CustomBottomPaymentButton({
    Key? key,
    this.totalDebt,
    this.onPressed,
  }) : super(key: key);

  final String? totalDebt;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 390,
          height: 74,
          color: AppColors.ORANGE,
          padding: AppPadding.horizontal20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                    text: 'Toplam Borç\n',
                    style:
                        AppTextStyle().getSfProDisplayLight_H6(AppColors.WHITE),
                    children: [
                      TextSpan(
                        text: totalDebt ?? '2.879,00',
                        style: AppTextStyle()
                            .getSfProDisplayBold_H5(AppColors.WHITE),
                        children: [
                          TextSpan(
                            text: ' TL',
                            style: AppTextStyle()
                                .getSfProDisplayLight_H6(AppColors.WHITE),
                          ),
                        ],
                      )
                    ]),
              ),
              Transform.translate(
                offset: const Offset(20, 0),
                child: CustomElevatedButton(
                  width: 170,
                  height: 36,
                  gradient: AppColors.FOOTER_BUTTON_GRADIENT,
                  onPressed: onPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(),
                      Text(
                        'Devam Et',
                        style: AppTextStyle().getSfProDisplayRegular_H5(
                          AppColors.ORANGE,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/icons/next_arrow_icon.svg',
                        width: 22,
                        height: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
