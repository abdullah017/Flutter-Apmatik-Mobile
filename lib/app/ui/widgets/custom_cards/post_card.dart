// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_common_widget.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/widgets/stacked_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class PostCardWidget extends StatefulWidget {
  PostCardWidget({
    Key? key,
    required this.postUserImage,
    required this.postUser,
    required this.postImage,
    required this.postTitle,
    required this.postDescription,
    required this.postTime,
  }) : super(key: key);

  final String postUserImage;
  final String postUser;
  final String postImage;
  final String postTitle;
  final String postDescription;
  String postTime;

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  @override
  void initState() {
    formatTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: AppPadding.guideLine,
        width: 350.w,
        height: Get.width == 390 ? 315.h : 320.h,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                  leading: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.deepOrangeAccent,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: widget.postUserImage,
                        fit: BoxFit.fill,
                        width: 17.w,
                        height: 17.h,
                      ),
                    ),
                  ),
                  minLeadingWidth: 0.0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                  dense: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.postUser,
                        style: AppTextStyle().get_SfProRounded_Medium_H6(
                          AppColors.BLACK,
                        ),
                      ),
                      const Icon(Icons.more_horiz),
                    ],
                  )),
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.postImage,
                    fit: BoxFit.fill,
                    width: 350.w,
                    height: 158.h,
                  ),
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
                      widget.postTitle,
                      style: AppTextStyle().get_SfProRounded_SemiBold_h5(
                        AppColors.BLACK,
                      ),
                    ),
                    Text(
                      widget.postTime,
                      style: AppTextStyle().getSfProDisplayRegular_Italic_H6(
                          AppColors.GREY_OPACITY),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.postDescription,
                      style: AppTextStyle()
                          .getSfProDisplayRegular_H6(AppColors.BLACK),
                    ),
                    buildStackedImages(
                      direction: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              buildArrowIconButton(),
            ],
          ),
        ));
  }

  formatTime() {
    var now = DateTime.now();
    var formatterTime = intl.DateFormat('hh:mm');
    widget.postTime = formatterTime.format(now);
  }
}

// CircleAvatar buildPostUserImage() {
//   return CircleAvatar(
//     radius: 12,
//     backgroundColor: Colors.deepOrangeAccent,
//     child: ClipOval(
//       child: CachedNetworkImage(
//         imageUrl: imageUrl,
//         fit: BoxFit.fill,
//         width: 17.w,
//         height: 17.h,
//       ),
//     ),
//   );
// }

// Row buildPostUserNameAndMoreIcon() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         'Ahmet Pehlivan',
//         style: AppTextStyle().get_SfProRounded_Medium_H6(
//           AppColors.BLACK,
//         ),
//       ),
//       Icon(Icons.more_horiz),
//     ],
//   );
// }

// Stack buildPostImage() {
//   return Stack(
//     children: [
//       Image.asset(
//         'assets/images/post.png',
//         width: 350.w,
//         height: 158.h,
//         fit: BoxFit.fill,
//       ),
//     ],
//   );
// }

// ListTile buildPostTitleAndDescription() {
//   return ListTile(
//     title: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           'Kapı Çöpleri Hakkında',
//           style: AppTextStyle().get_SfProRounded_SemiBold_h5(
//             AppColors.BLACK,
//           ),
//         ),
//         Text(
//           '8 saat önce',
//           style: AppTextStyle()
//               .getSfProDisplayRegular_Italic_H6(AppColors.GREY_OPACITY),
//         ),
//       ],
//     ),
//     subtitle: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Apartman Boyanması için apartmanımızda anket başlamıştır. Hemen katılıp bizimle fikirlerini paylaş!',
//           style: AppTextStyle().getSfProDisplayRegular_H6(AppColors.BLACK),
//         ),
//         buildStackedImages(direction: TextDirection.rtl),
//       ],
//     ),
//   );
// }

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
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            showSimple(message: 'Katıldığınız için teşekkürler');
          },
          icon: Icon(
            Icons.arrow_circle_up_outlined,
            size: 20.sm,
            color: AppColors.ORANGE,
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 0),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              showSimple(message: 'Katıldığınız için teşekkürler');
            },
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
    label: "Yukarı Taşıdı",
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
