import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustonNotificationIcon extends StatelessWidget {


  final VoidCallback? onTap;
  final bool hasNotification;

  const CustonNotificationIcon({
    Key? key,
    this.onTap,
    this.hasNotification = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(AppAssets.notification_icon)
              ],
            ),
            Positioned(
              top: Get.width >= 390 ? 15 : 28,
              right: 20,
              child: Container(
                width: 7,
                height: 7,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                alignment: Alignment.center,
                child: const Text('1'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
