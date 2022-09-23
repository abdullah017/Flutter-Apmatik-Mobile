import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';

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
        Card(
            elevation: 15,
            shadowColor: Colors.transparent,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                ).createShader(
                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.darken,
              child: imageWidget,
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: ListTile(
            title: Transform.translate(
              offset: const Offset(0, 5),
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
