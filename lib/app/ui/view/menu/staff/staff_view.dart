import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/view/menu/staff/staff_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbars/custom_appbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StaffView extends BaseView<StaffController> {
  StaffView({Key? key})
      : super(
          key: key,
          navBarHide: true,
        );
  @override
  Widget vBuilder() => Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.8,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    dense: true,
                    isThreeLine: true,
                    leading: Image.asset(
                      AppAssets.appbar,
                    ),
                    title: Text(
                      'YÖNETİCİ 1',
                      style:
                          appTextStyle.getSfProDisplayBold_h6(AppColors.ORANGE),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Apartman Yöneticisi'),
                        Text('+90 548 865 56381'),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ));
}
