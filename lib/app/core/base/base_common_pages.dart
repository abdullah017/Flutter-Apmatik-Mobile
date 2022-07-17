// ignore_for_file: deprecated_member_use

import 'package:apmatik_app/app/core/constant/asset_constants.dart';
import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:apmatik_app/app/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'base_controller.dart';

///
/// --------------------------------------------
/// There are many amazing [Function]s in this class.
/// Especialy in user interactions.
/// You can find and use on your Controller wich is the Controller extends [BaseController].
class BaseCommonPages implements _CommonPagesInterface {
  registerSuccess(
      {String? title,
      String? info,
      IconData? icon,
      bool? showLogo,
      required Function()? onPressed,
      required String buttonText}) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.ORANGE,
              radius: 40,
              child: Icon(
                icon ?? Icons.done_outline_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title ?? 'Kaydınız Başarı İle Tamamlandı',
              style: AppTextStyle().getSfProDisplayBold_h6(AppColors.BLACK),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.h),
              child: Text(
                info ??
                    'Apmatik kaydınız tamamlanmıştır. Hemen muhiti olduğunuz apartmanı ekleyin ve sizde evinizi cebinizden takip edin!',
                textAlign: TextAlign.center,
                style: AppTextStyle()
                    .getSfProDisplayRegular_H6(AppColors.GREY_OPACITY),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomElevatedButton(
                onPressed: onPressed ?? null, child: Text('$buttonText')),
            TextButton(
              onPressed: () {},
              child: Text(
                'Sorun Bildir',
                style:
                    AppTextStyle().getSfProDisplayRegular_H6(AppColors.BLACK),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            Visibility(
                visible: showLogo ?? true,
                child: Image(
                  image: AssetImage(AppAssets.statusPageLogo),
                ))
          ],
        ),
      ),
    );
  }
}

abstract class _CommonPagesInterface {
  registerSuccess(
      {String? title,
      String? info,
      IconData? icon,
      bool? showLogo,
      required Function()? onPressed,
      required String buttonText});
}
