import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/guest_card/show_guest_card/show_guestcard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_buttons/custom_elevated_button.dart';

class ShowGuestCardView extends BaseView<ShowGuestCardController> {
  ShowGuestCardView({super.key});

  @override
  Widget vBuilder() => ListView(
        children: [
          Container(
            color: AppColors.WHITE,
            padding: AppPadding.horizontal20,
            child: buildAddGuestArea(),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: AppPadding.guideLine,
            child: Text(
              'Misafir Kartları',
              style: appTextStyle.getSfProDisplayRegular_H5(
                AppColors.BLACK,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
            clipBehavior: Clip.none,
            padding: AppPadding.guideLine,
            shrinkWrap: true,
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('edit_guestcard');
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: CustomDecoration.defaultShadow,
                  child: ListTile(
                    dense: true,
                    isThreeLine: false,
                    leading: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(5, 5)),
                      child: Container(
                        width: 38,
                        height: 38,
                        color: AppColors.ORANGE,
                        child: SvgPicture.asset(
                          AppAssets.guest_image,
                          width: 24,
                          height: 24,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    title: Text(
                      '#120720220832D3K5',
                      style:
                          appTextStyle.getSfProDisplayBold_h6(AppColors.ORANGE),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: '“Burak Savaş”',
                              style:
                                  appTextStyle.getSfProDisplayRegular_H6_Bold(
                                      AppColors.BLACK),
                              children: [
                                TextSpan(
                                  text:
                                      ' isimli misafir için 12/07/2022 tarihinde oluşturuldu',
                                  style:
                                      appTextStyle.getSfProDisplayRegular_H66(
                                          AppColors.BACK_BUTTON_COLOR),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      );

  Column buildAddGuestArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          'guest_card_system'.tr,
          style: appTextStyle.getSfProDisplayMedium_H6(AppColors.BLACK),
        ),
        Row(
          children: [
            buildGuestInfoText(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildAddGuestButton(),
            buildGuestImage(),
          ],
        ),
      ],
    );
  }

  Flexible buildGuestInfoText() {
    return Flexible(
      child: SizedBox(
        width: Get.width * 0.65,
        child: Text(
          'show_guestcard_info'.tr,
          textAlign: TextAlign.left,
          style: appTextStyle.getSfProDisplayRegular_H6(AppColors.BLACK),
        ),
      ),
    );
  }

  Container buildGuestImage() {
    return Container(
        margin: const EdgeInsets.only(left: 20),
        alignment: Alignment.bottomRight,
        child: SvgPicture.asset(AppAssets.add_guest));
  }

  CustomElevatedButton buildAddGuestButton() {
    return CustomElevatedButton(
      width: 148.w,
      height: 30.h,
      margin: EdgeInsets.zero,
      onPressed: () {
        controller.navigateAddGuest();
      },
      child: Text('add_guest'.tr),
    );
  }
}
