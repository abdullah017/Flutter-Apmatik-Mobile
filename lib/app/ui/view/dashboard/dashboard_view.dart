import 'dart:ui';
import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/dashboard/dashboard_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_outline_textbutton.dart';
import 'package:apmatik/app/ui/widgets/custom_clippath/dotted_seperator.dart';
import 'package:apmatik/app/ui/widgets/custom_clippath/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashBoardView extends BaseView<DashBoardController> {
  DashBoardView({Key? key}) : super(key: key, appBarHide: false);
  @override
  Widget vBuilder() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Get.height * 0.11,
          ),
          Container(
            height: Get.width == 390 ? 205.h : 220.h,
            child: Stack(
              children: <Widget>[
                Container(
                  color: AppColors.ORANGE,
                  width: MediaQuery.of(Get.context!).size.width,
                  height: 190.0, // ORANGE BACKGROUND
                ),
                Positioned(
                  top: 15.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    width: 350.w,
                    height: Get.width == 390 ? 180.h : 200.h,
                    padding: AppPadding.guideLine,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                3.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 0,
                            child: ListTile(
                              contentPadding: AppPadding.guideLine20,
                              dense: true,
                              title: Text('Toplam Borç',
                                  style: appTextStyle.getSfProDisplayMedium_H5(
                                      AppColors.BLACK)),
                              subtitle: Text('2.879,00',
                                  style: appTextStyle.getSfProDisplayBold_H5(
                                      AppColors.ORANGE)),
                              trailing: Transform.translate(
                                offset: Offset(30, 0),
                                child: CustomElevatedButton(
                                    width: 90.w,
                                    height: 25.h,
                                    onPressed: () {},
                                    child: Text(
                                      'Hepsini Öde',
                                      style: AppTextStyle()
                                          .getSfProDisplayMedium_little(
                                              AppColors.WHITE),
                                    )),
                              ),
                            ),
                          ),
                          Divider(
                            color: AppColors.ORANGE,
                            indent: 20,
                            endIndent: 20,
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              //itemExtent: 40,

                              itemCount: 9,
                              itemBuilder: (context, index) {
                                return buildDeptCard();
                              },
                            ),
                          ),
                          buildMainPaymentCardInfoText(),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildLastPaymentsTitleText(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: Get.width >= 390 ? 20 : 30,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: InkWell(
                    onTap: () {
                      buildShowPaymentDetailCard(context);
                    },
                    child: buildLastPaymentsCard(),
                  ),
                );
              },
            ),
          )
        ],
      );

  buildDeptCard() {
    return Padding(
      padding: AppPadding.guideLineVertical3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
                text: 'Elektrik Borcu\n',
                style:
                    appTextStyle.getSfProDisplayMedium_little(AppColors.BLACK),
                children: [
                  TextSpan(
                    text: '22/02/2022',
                    style: appTextStyle
                        .getSfProDisplayMedium_Size8(AppColors.GREY),
                  )
                ]),
          ),
          Text.rich(
            TextSpan(
              text: '260.00₺',
              style:
                  appTextStyle.getSfProDisplayMedium_little(AppColors.ORANGE),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMainPaymentCardInfoText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          'Apartman borç bilgileri apartman yöneticileri tarafından sağlanmaktadır.',
          style: appTextStyle.getSfProDisplayLight_H6(AppColors.GREY)),
    );
  }

  Padding buildLastPaymentsTitleText() {
    return Padding(
      padding: AppPadding.guideLine10Vertical8,
      child: Text(
        'Son Ödemelerim',
        style: appTextStyle.getSfProDisplayRegular_H5(AppColors.DARK_GREY),
      ),
    );
  }

  Future<dynamic> buildShowPaymentDetailCard(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildPaymentsDetailCard(),
            ],
          ),
        ),
      ),
    );
  }

  FlutterTicketWidget buildPaymentsDetailCard() {
    return FlutterTicketWidget(
        width: 270.w,
        height: Get.width == 390 ? 270.h : 335.h,
        child: Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text('260.00₺',
                  style: appTextStyle.getSfProDisplayBold_H5(AppColors.ORANGE)),
              SizedBox(
                height: 20,
              ),
              MySeparator(
                color: AppColors.GREY,
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Tarih',
                  style:
                      appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
                ),
                subtitle: Text(
                  '12/02/2022 12:34',
                  style:
                      appTextStyle.get_SfProRounded_Medium_H5(AppColors.BLACK),
                ),
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Ödeme Metodu',
                  style:
                      appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
                ),
                subtitle: Text(
                  'Kredi Kartı',
                  style:
                      appTextStyle.get_SfProRounded_Medium_H5(AppColors.BLACK),
                ),
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Durum',
                  style:
                      appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
                ),
                subtitle: Text(
                  'Ödeme Tamamlandı',
                  style:
                      appTextStyle.get_SfProRounded_Medium_H5(AppColors.BLACK),
                ),
              ),
              CustomOutlineTextButton(
                  fixedSize: Size(220, 27),
                  buttonText: 'Mailime Gönder',
                  onPressed: () {}),
            ],
          ),
        ));
  }

  buildLastPaymentsCard() {
    return Container(
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 1.0, // soften the shadow
          spreadRadius: 1.0, //extend the shadow
          offset: Offset(
            0.0, // Move to right 10  horizontally
            1.0, // Move to bottom 10 Vertically
          ),
        )
      ], borderRadius: BorderRadius.circular(5.0), color: Colors.white),
      margin: AppPadding.guideLine,
      child: ListTile(
        dense: true,
        title: Text(
          'Apartman Aidatı',
          style: appTextStyle.getSfProDisplayMedium_little(AppColors.BLACK),
        ),
        subtitle: Text(
          '22/02/2022',
          style: appTextStyle.getSfProDisplayMedium_little(AppColors.GREY),
        ),
        trailing: Text(
          '260.00₺',
          style: appTextStyle.getSfProDisplayMedium_little(AppColors.ORANGE),
        ),
      ),
    );
  }
}
