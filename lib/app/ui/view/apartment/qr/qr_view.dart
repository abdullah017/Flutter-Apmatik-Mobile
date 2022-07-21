// ignore_for_file: must_be_immutable

import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:apmatik_app/app/ui/view/apartment/qr/qr_controller.dart';
import 'package:apmatik_app/app/ui/widgets/custom_appbar.dart';
import 'package:apmatik_app/app/ui/widgets/custom_elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrView extends BaseView<QrController> {
  @override
  Widget vBuilder() => Scaffold(
      backgroundColor: AppColors.PAGEBACKGROUND,
      appBar: CustomAppBar(),
      bottomSheet: Container(
        width: 390,
        height: 197,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'QR Kodunu Okutunuz',
              style: AppTextStyle().getSfProDisplaySemiBold_h6(AppColors.BLACK),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Yöneticinizde bulunan QR kodunu buraya okutarak apartmana hızlı bir şekilde kaydınızı oluşturabilirsiniz. Okuttuğunuz apartmana hızlıca yerleşeceksiniz.',
                style:
                    AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
                textAlign: TextAlign.justify,
              ),
            ),
            CustomElevatedButton(onPressed: () {}, child: Text('VAZGEÇ'))
          ],
        ),
      ),
      body: ListView(
        children: [
          MobileScanner(
            onDetect: ((barcode, args) {
              print('Barkod bulundu' + barcode.rawValue.toString());
            }),
          ),
        ],
      ));
}
