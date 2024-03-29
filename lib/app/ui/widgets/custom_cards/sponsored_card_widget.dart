import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/widgets/stacked_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SponsoredCardWidget extends StatelessWidget {
  const SponsoredCardWidget({
    Key? key, required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPadding.guideLine,
      width: 350.w,
      height: Get.width > 390 ? 307.h : 380.h,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.fill,
                        width: 350.w,
                        height: 320.h,
                      ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70.w,
                    height: 20.h,
                    decoration: const BoxDecoration(
                        color: AppColors.ORANGE,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(30))),
                    child: Text(
                      'Sponsorlu',
                      textAlign: TextAlign.center,
                      style: AppTextStyle()
                          .getSfProDisplayRegular_H5(AppColors.WHITE),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: buildStackedImages(direction: TextDirection.rtl),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildStackedImages({
  TextDirection direction = TextDirection.ltr,
}) {
  const double size = 30;
  const double xShift = 10;
  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

  final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

  return StackedWidgets(
    direction: direction,
    items: [
      ...items,
      ClipOval(
        child: Container(
          padding: const EdgeInsets.all(5),
          color: Colors.white,
          child: ClipOval(
              child: Container(
                  color: AppColors.ORANGE,
                  child: Center(
                    child: Text(
                      '+22',
                      style: AppTextStyle()
                          .get_SfProRounded_SemiBold_h6(AppColors.WHITE),
                    ),
                  ))),
        ),
      )
    ],
    size: size,
    xShift: xShift,
    label: "Bu anketi oyladı",
  );
}

Widget buildImage(String urlImage) {
  const double borderSize = 5;

  return ClipOval(
    child: Container(
      padding: const EdgeInsets.all(borderSize),
      color: Colors.white,
      child: ClipOval(
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
