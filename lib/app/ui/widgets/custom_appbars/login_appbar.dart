// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/widgets/custom_notification_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class CustomLoginUserAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Function()? onTap;
  const CustomLoginUserAppBar({Key? key, this.onTap}) : super(key: key);

  @override
  Size get preferredSize =>
      Get.width >= 390 ? Size.fromHeight(0.13.sw) : Size.fromHeight(0.20.sw);

  @override
  Widget build(BuildContext context) {
    // GetStorage? box = GetStorage();
    // var userLogin = box.read('isLogin') ?? false;

    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.ORANGE,
          elevation: 0,
          shadowColor: AppColors.WHITE_OPACITY,
          toolbarHeight: preferredSize.height,
          centerTitle: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: AppColors.WHITE,
                  ),
                  image: const DecorationImage(
                      image: AssetImage(AppAssets.appbar), fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: ListTile(
                  dense: true,
                  minVerticalPadding: 0,
                  title: Text(
                    'Samican Kıcır',
                    style: AppTextStyle()
                        .getSfProDisplaySemiBold_h6(AppColors.WHITE),
                  ),
                  subtitle: Transform.translate(
                    offset: const Offset(0, -5),
                    child: Text(
                      'Apartman Yöneticisi',
                      style: AppTextStyle()
                          .getSfProDisplayLight_Italic_H6(AppColors.WHITE),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            CustonNotificationIcon(
              onTap: () {
                Get.toNamed('notifications');
              },
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.notifications,
            //   ),
            // )
          ],
        ));
  }
}
