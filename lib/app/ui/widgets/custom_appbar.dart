// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onTap;
  const CustomAppBar({Key? key, this.onTap}) : super(key: key);

  @override
  Size get preferredSize =>
      Get.width >= 390 ? Size.fromHeight(0.10.sw) : Size.fromHeight(0.20.sw);

  @override
  Widget build(BuildContext context) {
    // GetStorage? box = GetStorage();
    // var userLogin = box.read('isLogin') ?? false;

    return PreferredSize(
      preferredSize: preferredSize,
      child:
          // userLogin
          //     ? AppBar(
          //         backgroundColor: AppColors.ORANGE,
          //         elevation: 10,
          //         shadowColor: AppColors.WHITE_OPACITY,
          //         toolbarHeight: preferredSize.height,
          //         centerTitle: false,
          //         title: Row(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             Container(
          //               width: 35,
          //               height: 35,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(50),
          //                 border: Border.all(
          //                   color: AppColors.WHITE,
          //                 ),
          //                 image: DecorationImage(
          //                     image: AssetImage(AppAssets.appbar),
          //                     fit: BoxFit.cover),
          //               ),
          //             ),
          //             Expanded(
          //               child: ListTile(
          //                 title: Text(
          //                   'Samican Kıcır',
          //                   style: AppTextStyle()
          //                       .getSfProDisplaySemiBold_h6(AppColors.WHITE),
          //                 ),
          //                 subtitle: Text(
          //                   'Apartman Yöneticisi',
          //                   style: AppTextStyle()
          //                       .getSfProDisplayLight_Italic_H6(AppColors.WHITE),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         actions: [
          //           CustonNotificationIcon(
          //             iconData: Icons.notifications_none,
          //           ),
          //           // IconButton(
          //           //   onPressed: () {},
          //           //   icon: Icon(
          //           //     Icons.notifications,
          //           //   ),
          //           // )
          //         ],
          //       )
          //     :
          AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: double.infinity,
        elevation: 0,
        toolbarHeight: preferredSize.height,
        leading: Padding(
          padding: EdgeInsets.only(left: 23, right: 80),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: InkWell(
              onTap: onTap ??
                  () {
                    Get.back();
                  },
              child: SvgPicture.asset(
                'assets/icons/back_button.svg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
