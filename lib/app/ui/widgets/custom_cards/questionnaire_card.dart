// ignore_for_file: sort_child_properties_last

import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/widgets/stacked_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QuestionnaireCardWidget extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Widget? image;
  final String? title;
  final String? description;
  final String? time;
  final double? elevation;
  final bool? buttonVisible;
  final bool? tagVisible;
  final Function()? onPressed;
  const QuestionnaireCardWidget(
      {Key? key,
      this.margin,
      this.image,
      this.title,
      this.description,
      this.time,
      this.buttonVisible = true,
      this.tagVisible = true,
      this.onPressed,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? AppPadding.guideLine,
      width: 350.w,
      height: buttonVisible!
          ? Get.width == 390
              ? 280.h
              : 301.h
          : Get.width == 390
              ? 250.h
              : 251.h,
      child: Card(
        elevation: elevation ?? 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                image ??
                    Image.asset(
                      'assets/images/anket.png',
                      width: margin == EdgeInsets.zero ? 400.w : 350.w,
                      height: 135.h,
                      fit: BoxFit.fill,
                    ),
                Visibility(
                  visible: tagVisible ?? true,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70.w,
                      height: 20.h,
                      decoration: const BoxDecoration(
                        color: AppColors.ORANGE,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topRight: Radius.circular(5)),
                      ),
                      child: Text(
                        'Anket',
                        textAlign: TextAlign.center,
                        style: AppTextStyle()
                            .getSfProDisplayRegular_H5(AppColors.WHITE),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title ?? 'Apartman Boyanması',
                    style: AppTextStyle().get_SfProRounded_SemiBold_h5(
                      AppColors.BLACK,
                    ),
                  ),
                  Text(
                    time ?? '8 saat önce',
                    style: AppTextStyle().getSfProDisplayRegular_Italic_H6(
                        AppColors.GREY_OPACITY),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description ??
                        'Apartman Boyanması için apartmanımızda anket başlamıştır. Hemen katılıp bizimle fikirlerini paylaş!',
                    style: AppTextStyle()
                        .getSfProDisplayRegular_H66(AppColors.BLACK),
                  ),
                  buildStackedImages(direction: TextDirection.rtl),
                ],
              ),
            ),
            Visibility(
              visible: buttonVisible!,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: TextButton(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
                      child: Text("Detaylar",
                          style: AppTextStyle()
                              .getSfProDisplayRegular_H5(AppColors.ORANGE)),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: AppColors.ORANGE),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(89.w, 27.h),
                      ),
                    ),
                    onPressed: onPressed),
              ),
            ),
            SizedBox(
              height: 17.h,
            )
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
