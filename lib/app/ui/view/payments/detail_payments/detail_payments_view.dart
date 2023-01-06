import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/payments/detail_payments/detail_payments_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPaymentsView extends BaseView<PaymentDetailControlelr> {
  DetailPaymentsView({Key? key}) : super(key: key, appBarHide: false);

  @override
  Widget vBuilder() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return buildMoneyTransfer();
      },
    );
  }

  Container buildCreditCardPayment() {
    return Container(
      padding: AppPadding.horizontal10,
      margin: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 20.w, right: 20.w),
      decoration: CustomDecoration.defaultShadow,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0.h),
            child: Text('Toplam Çekilen',
                style: appTextStyle.getSfProDisplayRegular_H6(
                  AppColors.BLACK,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0.h),
            child: Text('2650.00 ₺',
                style: appTextStyle.getSfProDisplayBold(
                  AppColors.ORANGE,
                )),
          ),
          Row(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText('Tarih: '),
                      buildText('Saat: '),
                      buildText('Yöntem: '),
                      buildText('Durum: '),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText('12/02/2022'),
                      buildText('13:50'),
                      buildText('Kredi Kartı'),
                      buildText('Tamamlandı'),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          )
        ],
      ),
    );
  }

  Container buildMoneyTransfer() {
    return Container(
      padding: AppPadding.horizontal10,
      margin: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 20.w, right: 20.w),
      decoration: CustomDecoration.defaultShadow,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0.h),
            child: Text('Toplam Çekilen',
                style: appTextStyle.getSfProDisplayRegular_H6(
                  AppColors.BLACK,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0.h),
            child: Text('2650.00 ₺',
                style: appTextStyle.getSfProDisplayBold(
                  AppColors.ORANGE,
                )),
          ),
          Row(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText('Tarih: '),
                      buildText('Saat: '),
                      buildText('Yöntem: '),
                      buildText('Durum: '),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText('12/02/2022'),
                      buildText('13:50'),
                      buildText('Havale/Eft'),
                      buildText('Onay Bekliyor'),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          )
        ],
      ),
    );
  }

  Text buildText(String title) {
    return Text(title,
        textAlign: TextAlign.start,
        style: appTextStyle.getSfProDisplayRegular_H5(
          AppColors.BLACK,
        ));
  }
}
