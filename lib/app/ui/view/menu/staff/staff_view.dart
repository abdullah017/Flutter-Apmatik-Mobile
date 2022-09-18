import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/menu/staff/staff_controller.dart';
import 'package:flutter/material.dart';

class StaffView extends BaseView<StaffController> {
  StaffView({Key? key})
      : super(key: key, appBarHide: false // false
            );
  @override
  Widget vBuilder() => ListView(
        children: [
          ListView.builder(
            clipBehavior: Clip.none,
            padding: AppPadding.horizontal10Vertical15,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: AppPadding.allPadding8,
                decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
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
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: ListTile(
                  dense: true,
                  isThreeLine: true,
                  leading: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(5, 5)),
                    child: Image.asset(
                      AppAssets.appbar,
                    ),
                  ),
                  title: Text(
                    'YÖNETİCİ 1',
                    style:
                        appTextStyle.getSfProDisplayBold_h6(AppColors.ORANGE),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apartman Yöneticisi',
                        style: AppTextStyle()
                            .getSfProDisplayRegular_H5(Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '+90 548 865 56381',
                        style: AppTextStyle()
                            .getSfProDisplayLight_H5(Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      );
}
