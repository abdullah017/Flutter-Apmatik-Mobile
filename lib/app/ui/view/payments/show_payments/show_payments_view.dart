import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/payments/show_payments/show_payments_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShowPaymentsView extends BaseView<ShowPaymentsController> {
  ShowPaymentsView({super.key});
  @override
  Widget vBuilder() => Column(
        children: [
          SizedBox(
            height: Get.height * 0.05.h,
          ),
          Center(
              child: Container(
            decoration: CustomDecoration.defaultShadow,
            width: 400,
            height: 180,
            child: SfCircularChart(
              onLegendItemRender: (args) {
                // Setting color for the series legend based on its index.
              },
              title: ChartTitle(
                  text: 'Ödemelerim',
                  textStyle: appTextStyle
                      .getSfProDisplayMedium_little(AppColors.BLACK),
                  alignment: ChartAlignment.near),
              legend: Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.scroll,
                legendItemBuilder: (legendText, series, point, seriesIndex) {
                  return SizedBox(
                      height: 30,
                      width: 150,
                      child: Row(children: <Widget>[
                        CircleAvatar(radius: 7, backgroundColor: point.color),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(legendText.toString()), //index
                      ]));
                },
              ),
              series: <CircularSeries>[
                DoughnutSeries<ChartData, String>(
                  dataSource: controller.chartData,
                  xValueMapper: (ChartData data, _) => data.continent,
                  yValueMapper: (ChartData data, _) => data.gdp,
                  pointColorMapper: (ChartData data, _) => data.color,
                )
              ],
            ),
          )),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Expanded(
            child: Container(
              decoration: CustomDecoration.defaultShadow,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 20, bottom: 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Ödemelerim')),
                  ),
                  Expanded(
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: AppPadding.horizontal10,
                            decoration: CustomDecoration.defaultShadow,
                            child: ListTile(
                              dense: true,
                              isThreeLine: true,
                              title: Text(
                                '2650.00 ₺',
                                style: appTextStyle.getSfProDisplayBold_h6(
                                  AppColors.ORANGE,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kredi Kartı',
                                    style: appTextStyle
                                        .getSfProDisplayLight_Italic_H6(
                                      AppColors.GREY,
                                    ),
                                  ),
                                  Text(
                                    '12/02/2022 19:10',
                                    style:
                                        appTextStyle.getSfProDisplayRegular_H6(
                                      AppColors.BLACK,
                                    ),
                                  ),
                                  Text(
                                    'Asmalı Konak',
                                    style: appTextStyle
                                        .getSfProDisplayLight_Italic_H6(
                                      AppColors.GREY,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(AppAssets.arrow_icon)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
}
