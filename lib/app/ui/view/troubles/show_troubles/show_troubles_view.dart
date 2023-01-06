import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/troubles/show_troubles/show_troubles_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_buttons/custom_elevated_button.dart';

class ShowTroublesView extends BaseView<ShowTroublesController> {
  ShowTroublesView({super.key});

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
              'Arıza Listesi',
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
            itemCount: 1,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  //
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
                          AppAssets.troubles_white,
                          width: 24,
                          height: 24,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    title: Text(
                      'Su Kaçağı Problemi',
                      style: appTextStyle
                          .getSfProDisplaySemiBold_h6(AppColors.ORANGE),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text.rich(
                          WidgetSpan(
                              child: Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.troubles_home,
                                width: 11,
                                height: 11,
                                fit: BoxFit.none,
                              ),
                              Text('Asmalı Konak',
                                  style: appTextStyle.getSfProDisplayRegular_H6(
                                    AppColors.GREY,
                                  )),
                            ],
                          )),
                        ),
                        Text(
                          '12/02/2022',
                          style: appTextStyle
                              .getSfProDisplayRegular_H5(AppColors.BLACK),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomElevatedButton(
                            margin: EdgeInsets.zero,
                            onPressed: () {},
                            width: 90,
                            height: 20,
                            child: Text(
                              'Çözülmedi',
                              style: appTextStyle
                                  .getSfProDisplayRegular_H6(AppColors.WHITE),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppAssets.arrow_icon,
                      ),
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
          'troubles_title'.tr,
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
          'troubles_subtitle'.tr,
          textAlign: TextAlign.left,
          style: appTextStyle.getSfProDisplayRegular_H6(AppColors.BLACK),
        ),
      ),
    );
  }

  Container buildGuestImage() {
    return Container(
        margin: const EdgeInsets.only(left: 20, bottom: 10),
        alignment: Alignment.bottomRight,
        child: SvgPicture.asset(AppAssets.troubles));
  }

  CustomElevatedButton buildAddGuestButton() {
    return CustomElevatedButton(
      width: 148.w,
      height: 30.h,
      margin: EdgeInsets.zero,
      onPressed: () {
        controller.navigateAddGuest();
      },
      child: Text('troubles_button'.tr),
    );
  }
}
