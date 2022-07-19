import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustonNotificationIcon extends StatelessWidget {
  final IconData iconData;

  final VoidCallback? onTap;
  final bool hasNotification;

  const CustonNotificationIcon({
    Key? key,
    this.onTap,
    required this.iconData,
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
                Icon(
                  iconData,
                  size: 30,
                ),
              ],
            ),
            Positioned(
              top: Get.width >= 390 ? 10 : 28,
              right: 20,
              child: Container(
                width: 7,
                height: 7,
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                alignment: Alignment.center,
                child: Text('1'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
