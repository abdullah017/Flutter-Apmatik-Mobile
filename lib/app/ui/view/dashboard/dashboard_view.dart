// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/dashboard/dashboard_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/dotted_seperator.dart';
import 'package:apmatik/app/ui/widgets/login_appbar.dart';
import 'package:apmatik/app/ui/widgets/ticket_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardView extends BaseView<DashBoardController> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget vBuilder() => Scaffold(
        backgroundColor: AppColors.PAGEBACKGROUND,
        appBar: CustomLoginUserAppBar(),
        // ignore: invalid_use_of_protected_member
        bottomSheet: controller.duyuru.isNotEmpty
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  width: 390,
                  height: 320,
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
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Apartman Çalışması Hakkında',
                        style: AppTextStyle()
                            .getSfProDisplaySemiBold_h6(AppColors.BLACK),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Apartmanda yapacağımız çalışma nedeniyle pazartesi ve çarşamba günleri arasında bakım çalışması yapacağımızdan giriş çıkışlara dikkat etmenizi öneririz. Herkese iyi bayramlar!',
                          style: AppTextStyle()
                              .getSfProDisplayRegular_H5(AppColors.BLACK),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RadioListTile<int>(
                        activeColor: Colors.orange,
                        value: 1,
                        groupValue: controller.radiovalue,
                        title: Text('Tekrar Gösterme'),
                        selected: controller.selectedRadio,
                        //toggleable: true,
                        onChanged: (value) {
                          controller.radiovalue = value!;
                          controller.selectedRadio = !controller.selectedRadio;
                          controller.update();
                        },
                      ),
                      CustomElevatedButton(
                          onPressed: () {
                            Get.back();
                            controller.duyuru.removeAt(0);
                            controller.update();
                          },
                          child: Text('TAMAM')),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Bu bilgi apartman yöneticiniz tarafından sağlanmaktadır.',
                          style: AppTextStyle()
                              .getSfProDisplayLight_H5(AppColors.BLACK),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,
        key: _scaffoldKey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 260.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: AppColors.ORANGE,
                    width: MediaQuery.of(Get.context!).size.width,
                    height: 180.0,
                  ),
                  Positioned(
                    top: 10.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      width: 350,
                      height: 240,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.0),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 0,
                              child: ListTile(
                                dense: true,
                                title: Text('Toplam Borç',
                                    style:
                                        appTextStyle.getSfProDisplayMedium_H5(
                                            AppColors.BLACK)),
                                subtitle: Text('2.879,00',
                                    style: appTextStyle.getSfProDisplayBold_H5(
                                        AppColors.ORANGE)),
                                trailing: Transform.translate(
                                  offset: Offset(30, 0),
                                  child: CustomElevatedButton(
                                      width: 90,
                                      height: 25,
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
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemExtent: 40,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    minVerticalPadding: 0,
                                    minLeadingWidth: 0,
                                    dense: true,
                                    title: Text(
                                      'Elektrik Borcu',
                                      style: appTextStyle
                                          .getSfProDisplayMedium_little(
                                              AppColors.BLACK),
                                    ),
                                    subtitle: Text(
                                      '22/02/2022',
                                      style: appTextStyle
                                          .getSfProDisplayMedium_little(
                                              AppColors.GREY),
                                    ),
                                    trailing: Text(
                                      '260.00₺',
                                      style: appTextStyle
                                          .getSfProDisplayMedium_little(
                                              AppColors.ORANGE),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Apartman borç bilgileri apartman yöneticileri tarafından sağlanmaktadır.',
                                  style: appTextStyle
                                      .getSfProDisplayLight_H6(AppColors.GREY)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Text(
                'Son Ödemelerim',
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterTicketWidget(
                                      width: 270,
                                      height: 270,
                                      child: Material(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text('260.00₺',
                                                style: appTextStyle
                                                    .getSfProDisplayBold_h6(
                                                        AppColors.ORANGE)),
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
                                                style: appTextStyle
                                                    .getSfProDisplayRegular_H6(
                                                        AppColors.BLACK),
                                              ),
                                              subtitle: Text(
                                                '12/02/2022 12:34',
                                                style: appTextStyle
                                                    .get_SfProRounded_Medium_H5(
                                                        AppColors.BLACK),
                                              ),
                                            ),
                                            ListTile(
                                              dense: true,
                                              title: Text(
                                                'Ödeme Metodu',
                                                style: appTextStyle
                                                    .getSfProDisplayRegular_H6(
                                                        AppColors.BLACK),
                                              ),
                                              subtitle: Text(
                                                'Kredi Kartı',
                                                style: appTextStyle
                                                    .get_SfProRounded_Medium_H5(
                                                        AppColors.BLACK),
                                              ),
                                            ),
                                            ListTile(
                                              dense: true,
                                              title: Text(
                                                'Durum',
                                                style: appTextStyle
                                                    .getSfProDisplayRegular_H6(
                                                        AppColors.BLACK),
                                              ),
                                              subtitle: Text(
                                                'Ödeme Tamamlandı',
                                                style: appTextStyle
                                                    .get_SfProRounded_Medium_H5(
                                                        AppColors.BLACK),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            'Apartman Aidatı',
                            style: appTextStyle
                                .getSfProDisplayMedium_little(AppColors.BLACK),
                          ),
                          subtitle: Text(
                            '22/02/2022',
                            style: appTextStyle
                                .getSfProDisplayMedium_little(AppColors.GREY),
                          ),
                          trailing: Text(
                            '260.00₺',
                            style: appTextStyle
                                .getSfProDisplayMedium_little(AppColors.ORANGE),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
}
