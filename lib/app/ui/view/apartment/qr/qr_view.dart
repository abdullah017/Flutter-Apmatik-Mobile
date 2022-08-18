// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';

import 'package:apmatik/app/ui/view/apartment/qr/qr_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrView extends BaseView<QrController> {
  @override
  Widget vBuilder() => Scaffold(
      backgroundColor: AppColors.PAGEBACKGROUND,
      bottomSheet: Container(
        width: 390,
        height: 197,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'read_qr'.tr,
              style: AppTextStyle().getSfProDisplaySemiBold_h6(AppColors.BLACK),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'read_qr_info'.tr,
                style:
                    AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
                textAlign: TextAlign.justify,
              ),
            ),
            CustomElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('give_up'.tr))
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              MobileScanner(
                controller: controller.qrController,
                allowDuplicates: false,
                onDetect: ((barcode, args) {
                  print('Barkod bulundu' + barcode.rawValue.toString());
                  if (barcode.rawValue!.isNotEmpty) {
                    Get.toNamed('selectapartment');
                  }
                }),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(bottom: 250),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.red,
                  )),
                ),
              )
            ],
          ),
        ],
      ));
}
