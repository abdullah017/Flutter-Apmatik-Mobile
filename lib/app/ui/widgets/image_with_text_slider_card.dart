import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWithTextSliderCard extends StatelessWidget {
  final String imageTitle;
  final String imageDescription;
  final Widget imageWidget;
  const ImageWithTextSliderCard({
    Key? key,
    required this.imageTitle,
    required this.imageDescription,
    required this.imageWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 200.h,
          child: Card(
            elevation: 15,
            shadowColor: Colors.transparent,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.darken,
              child: imageWidget,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ListTile(
            title: Transform.translate(
              offset: Offset(0, 5),
              child: Text(
                imageTitle,
                style: AppTextStyle().getSfProDisplayMedium_H6(AppColors.WHITE),
              ),
            ),
            subtitle: Text(
              imageDescription,
              style: AppTextStyle().getSfProDisplayLight_H6(AppColors.WHITE),
            ),
          ),
        )
      ],
    );
  }
}
