import 'dart:ui';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatelessWidget {
  final void Function()? onPressed;
  const CustomBottomSheet({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Container(
        width: 390.w,
        height: 320.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Apartman Çalışması Hakkında',
              style: AppTextStyle().getSfProDisplaySemiBold_h6(AppColors.BLACK),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Apartmanda yapacağımız çalışma nedeniyle pazartesi ve çarşamba günleri arasında bakım çalışması yapacağımızdan giriş çıkışlara dikkat etmenizi öneririz. Herkese iyi bayramlar!',
                style:
                    AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
                textAlign: TextAlign.center,
              ),
            ),
            RadioListTile<int>(
              activeColor: Colors.orange,
              value: 1,
              groupValue: 1, //controller.radiValue!.value,
              title: Text('Tekrar Gösterme'),
              selected: true, //controller.selectedRadio,
              onChanged: (int? value) {
                // controller.selectUS(value);
                // controller.update();
              },
            ),
            CustomElevatedButton(
                onPressed: onPressed,
                // () {
                //   // Get.close;
                //   // Get.back();
                //   // print('BEN AÇLIŞTIM');
                //   // // controller.duyuru.removeAt(0);
                //   // // controller.update();
                // },
                child: Text('TAMAM')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Bu bilgi apartman yöneticiniz tarafından sağlanmaktadır.',
                style: AppTextStyle().getSfProDisplayLight_H5(AppColors.BLACK),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
