import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
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
            padding: AppPadding.guideLine,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
               margin: EdgeInsets.only(bottom: 8),
                decoration:CustomDecoration.defaultShadow,
                child: ListTile(
                  dense: true,
                  isThreeLine: true,
                  leading: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(5, 5)),
                    child: Image.asset(
                      AppAssets.appbar,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  title: Text(
                    'Mustafa Dilmaç',
                    style:
                        appTextStyle.getSfProDisplayBold_h6(AppColors.ORANGE),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apartman Yöneticisi',
                        style: AppTextStyle()
                            .getSfProDisplayRegular_H66(AppColors.BACK_BUTTON_COLOR),
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
