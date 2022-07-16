// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onTap;
  const CustomAppBar({Key? key, this.onTap}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(0.2.sw);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
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
