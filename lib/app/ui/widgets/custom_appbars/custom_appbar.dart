import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Function()? onTap;
  final String? title;
  const CustomAppBar({Key? key, this.onTap, this.title}) : super(key: key);

  @override
  Size get preferredSize =>
      Get.width >= 390 ? Size.fromHeight(0.1.sw) : Size.fromHeight(0.15.sw);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leadingWidth: 70,
        elevation: 0,
        toolbarHeight: preferredSize.height,
        title: Transform.translate(
          offset: Offset(-20, 0),
          child: Text(title ?? '',
              style: AppTextStyle().getSfProDisplayBold_h6(AppColors.ORANGE)),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              'assets/icons/back_button.svg',
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
