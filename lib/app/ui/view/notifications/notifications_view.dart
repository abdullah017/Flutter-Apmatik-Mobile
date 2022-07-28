// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/view/notifications/notifications_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsView extends BaseView<NotificationsController> {
  @override
  Widget vBuilder() => Scaffold(
      backgroundColor: AppColors.PAGEBACKGROUND,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: ListView(
          children: [
            Text(
              'Yeni',
              style:
                  appTextStyle.getSfProDisplayLight_Italic_H6(AppColors.GREY),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.orange[100],
                  child: Container(
                      width: 350,
                      height: 66.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Apartman Temizliği',
                            style: appTextStyle
                                .getSfProDisplayMedium_H6(AppColors.ORANGE),
                          ),
                          Text(
                            'Apartman temizliği için tüm sakinlerimizin çöplerini kapı önüne koyması önemle rica olunur. Daha sonradan konacak çöplerin hafta sonu alınacağını önden bildirmek isteriz. Apartman yönetimi...',
                            style: appTextStyle
                                .getSfProDisplayRegular_H7(AppColors.BLACK),
                          ),
                          Text(
                            '22/07/2022 13:30',
                            style: appTextStyle
                                .getSfProDisplayLight_H6(AppColors.BLACK),
                          ),
                        ],
                      )),
                );
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Daha Eski',
              style:
                  appTextStyle.getSfProDisplayLight_Italic_H6(AppColors.GREY),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Container(
                      width: 350,
                      height: 66.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Apartman Temizliği',
                            style: appTextStyle
                                .getSfProDisplayMedium_H6(AppColors.ORANGE),
                          ),
                          Text(
                            'Apartman temizliği için tüm sakinlerimizin çöplerini kapı önüne koyması önemle rica olunur. Daha sonradan konacak çöplerin hafta sonu alınacağını önden bildirmek isteriz. Apartman yönetimi...',
                            style: appTextStyle
                                .getSfProDisplayRegular_H7(AppColors.BLACK),
                          ),
                          Text(
                            '22/07/2022 13:30',
                            style: appTextStyle
                                .getSfProDisplayLight_H6(AppColors.BLACK),
                          ),
                        ],
                      )),
                );
              },
            ),
          ],
        ),
      ));
}