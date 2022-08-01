import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/widgets/stacked_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: 350.w,
      height: Get.width >= 390 ? 315.h : 340.h,
      // Get.width > 390 ? Get.height * .15.h : Get.height * .10.h,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: buildPostUserImage(),
              minLeadingWidth: 0.0,
              contentPadding: EdgeInsets.symmetric(horizontal: 14),
              dense: true,
              title: buildPostUserNameAndMoreIcon(),
            ),
            buildPostImage(),
            SizedBox(
              height: 10.h,
            ),
            buildPostTitleAndDescription(),
            buildArrowIconButton(),
          ],
        ),
      ),
    );
  }

  CircleAvatar buildPostUserImage() {
    return CircleAvatar(
      radius: 12,
      backgroundColor: Colors.deepOrangeAccent,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: "https://via.placeholder.com/140x100",
          fit: BoxFit.fill,
          width: 17.w,
          height: 17.h,
        ),
      ),
    );
  }

  Row buildPostUserNameAndMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Ahmet Pehlivan',
          style: AppTextStyle().get_SfProRounded_Medium_H6(
            AppColors.BLACK,
          ),
        ),
        Icon(Icons.more_horiz),
      ],
    );
  }

  Stack buildPostImage() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/post.png',
          width: 350.w,
          height: 158.h,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  ListTile buildPostTitleAndDescription() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Kapı Çöpleri Hakkında',
            style: AppTextStyle().get_SfProRounded_SemiBold_h5(
              AppColors.BLACK,
            ),
          ),
          Text(
            '8 saat önce',
            style: AppTextStyle()
                .getSfProDisplayRegular_Italic_H6(AppColors.GREY_OPACITY),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apartman Boyanması için apartmanımızda anket başlamıştır. Hemen katılıp bizimle fikirlerini paylaş!',
            style: AppTextStyle().getSfProDisplayRegular_H6(AppColors.BLACK),
          ),
          buildStackedImages(direction: TextDirection.rtl),
        ],
      ),
    );
  }

  Padding buildArrowIconButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {},
            icon: Icon(
              Icons.arrow_circle_up_outlined,
              size: 20.sm,
              color: AppColors.ORANGE,
            ),
          ),
          Transform.translate(
            offset: Offset(0, 0),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {},
              icon: Icon(
                Icons.arrow_circle_down_outlined,
                size: 20.sm,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildStackedImages({
  TextDirection direction = TextDirection.ltr,
}) {
  final double size = 30;
  final double xShift = 10;
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
          padding: EdgeInsets.all(5),
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
    label: "Yukarı Taşıdı",
  );
}

Widget buildImage(String urlImage) {
  final double borderSize = 5;

  return ClipOval(
    child: Container(
      padding: EdgeInsets.all(borderSize),
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
