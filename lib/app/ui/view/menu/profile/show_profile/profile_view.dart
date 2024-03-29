import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/menu/profile/show_profile/profile_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_outline_textbutton.dart';
import 'package:apmatik/app/ui/widgets/custom_cards/plate_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends BaseView<ProfileController> {
  ProfileView({Key? key})
      : super(key: key, appBarHide: false // false
            );
  @override
  Widget vBuilder() => buildView();

  buildView() {
    return ListView(
      padding: AppPadding.guideLine,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
            ),
            SizedBox(
              height: Get.width >= 390 ? 250.0.h : 280.h,
              child: SizedBox(
                width: 350.w,
                height: Get.width >= 390 ? 230.h : 270.h,
                child: DecoratedBox(
                  decoration: CustomDecoration.defaultShadow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 0,
                        child: buildMainCard(),
                      ),
                      buildUserPhoneNumber(),
                      buildUserMaritalStatusAndJob(),
                      buildUserChildrenAndPet(),
                      Transform.translate(
                        offset: const Offset(0, -10),
                        child: CustomOutlineTextButton(
                          fixedSize: const Size(340, 35),
                          buttonText: 'edit_profile'.tr,
                          onPressed: () {
                            controller.goEditProfileView();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                Container(
                    decoration: CustomDecoration.defaultShadow,
                    child: buildRegisteredCars()),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                    decoration: CustomDecoration.defaultShadow,
                    child: buildAboutMembership()),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Container buildAboutMembership() {
    return Container(
      width: 350.w,
      height: Get.width >= 390 ? 110.h : 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: AppColors.WHITE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
            child: Text(
              'about_membership'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),

          ///
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                      text: 'date_of_registration'.tr,
                      style: appTextStyle
                          .getSfProDisplayRegular_Italic_H6(AppColors.BLACK),
                      children: [
                        TextSpan(
                          text: '\n10 Ocak 2022',
                          style: appTextStyle
                              .getSfProDisplaySemiBold_h6(AppColors.BLACK),
                        ),
                      ]),
                ),
                SizedBox(
                  width: 50.h,
                ),
                Text.rich(
                  TextSpan(
                      text: 'invoices_number'.tr,
                      style: appTextStyle
                          .getSfProDisplayRegular_Italic_H6(AppColors.BLACK),
                      children: [
                        TextSpan(
                          text: '\n18',
                          style: appTextStyle
                              .getSfProDisplaySemiBold_h6(AppColors.BLACK),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
            ),
            child: Text.rich(
              TextSpan(
                  text: 'payment_plan'.tr,
                  style: appTextStyle
                      .getSfProDisplayRegular_Italic_H6(AppColors.BLACK),
                  children: [
                    TextSpan(
                        text: '\n120',
                        style: appTextStyle
                            .getSfProDisplaySemiBold_h6(AppColors.ORANGE),
                        children: [
                          TextSpan(
                            text: '/145 ',
                            style: appTextStyle
                                .getSfProDisplaySemiBold_h6(AppColors.BLACK),
                          ),
                          const WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(Icons.circle,
                                size: 7, color: AppColors.ORANGE),
                          ),
                          TextSpan(
                            text: 'iyi',
                            style: appTextStyle
                                .getSfProDisplaySemiBold_h6(AppColors.ORANGE),
                          ),
                        ]),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Column buildRegisteredCars() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
          child: Text(
            'registered_cars'.tr,
            style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
          ),
        ),

        ///
        ///
        ///

        controller.cars.isEmpty
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 1.h),
                child: Text(
                  'Kayıtlı Araç bulunamıyor',
                  style: appTextStyle
                      .getSfProDisplayLight_Italic_H6(AppColors.BLACK),
                ),
              )
            : SizedBox(
                width: 350.w,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.cars.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20.w, vertical: 3),
                        child: PlateCardWidget(
                          width: 310.w,
                          height: 30.h,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            width: 310.w,
                            height: 30.h,
                            color: AppColors.ORANGE,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.cars[index],
                                  style:
                                      appTextStyle.get_SfProRounded_SemiBold_h5(
                                          AppColors.WHITE),
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(AppAssets.remove_icon))
                              ],
                            )),
                          ),
                        ),
                      );
                    }),
              ),
        controller.cars.isEmpty
            ? CustomElevatedButton(
                margin: const EdgeInsets.only(top: 10, left: 20),
                width: 100,
                height: 30,
                onPressed: () {},
                child: const Text('Araç Ekle'),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomOutlineTextButton(
                  fixedSize: const Size(310, 35),
                  buttonText: 'manage_cars'.tr,
                  onPressed: () {
                    controller.goEditProfileView();
                  },
                )),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  buildUserChildrenAndPet() {
    return Transform.translate(
      offset: const Offset(0, -15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text.rich(
              TextSpan(
                text: 'Çocuk Sayısı\n',
                style: appTextStyle
                    .getSfProDisplayRegular_Italic_H6(AppColors.GREY),
                children: [
                  TextSpan(
                    text: '2',
                    style: appTextStyle
                        .getSfProDisplaySemiBold_h6(AppColors.BLACK),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 95.w),
            child: Text.rich(
              TextSpan(
                text: 'Evcil Hayvan\n',
                style: appTextStyle
                    .getSfProDisplayRegular_Italic_H6(AppColors.GREY),
                children: [
                  TextSpan(
                    text: 'Var',
                    style: appTextStyle
                        .getSfProDisplaySemiBold_h6(AppColors.BLACK),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildUserMaritalStatusAndJob() {
    return Transform.translate(
      offset: const Offset(0, -20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text.rich(
              TextSpan(
                text: 'Medeni Hali\n',
                style: appTextStyle
                    .getSfProDisplayRegular_Italic_H6(AppColors.GREY),
                children: [
                  TextSpan(
                    text: 'Evli',
                    style: appTextStyle
                        .getSfProDisplaySemiBold_h6(AppColors.BLACK),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 47.w),
            child: Text.rich(
              TextSpan(
                text: 'Meslek\n',
                style: appTextStyle
                    .getSfProDisplayRegular_Italic_H6(AppColors.GREY),
                children: [
                  TextSpan(
                    text: 'Yazılım Geliştirici',
                    style: appTextStyle
                        .getSfProDisplaySemiBold_h6(AppColors.BLACK),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildUserPhoneNumber() {
    return Transform.translate(
      offset: const Offset(3, -15),
      child: ListTile(
        minVerticalPadding: 0,
        minLeadingWidth: 0,
        dense: true,
        title: Text(
          'Telefon Numarası',
          style: appTextStyle.getSfProDisplayRegular_Italic_H6(AppColors.GREY),
        ),
        subtitle: Text(
          '+905458656381',
          style: appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
        ),
      ),
    );
  }

  buildMainCard() {
    return Padding(
      padding: AppPadding.horizontal20Vertical10,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.ORANGE, width: 2),
                borderRadius: BorderRadius.circular(50)),
            child: CircleAvatar(
              backgroundImage: const AssetImage(
                AppAssets.mng,
              ),
              radius: 30.r,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                ),
                child: Text('Mustafa Dilmaç',
                    style: appTextStyle
                        .get_SfProRounded_SemiBold_h4(AppColors.ORANGE)),
              ),
              Text('mdilmac9@gmail.com',
                  style:
                      appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
              const SizedBox(
                height: 5,
              ),
              CustomElevatedButton(
                  margin: EdgeInsets.zero,
                  width: 140.w,
                  height: 20.h,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 3.r,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('Komşularım Beni Görebilir',
                          style: appTextStyle
                              .getSfProDisplayLight_H6(AppColors.WHITE)),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  ListTile buildUserCardHeader() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: const AssetImage(
          AppAssets.appbar,
        ),
        radius: 30.r,
      ),
      dense: true,
      title: Padding(
        padding: const EdgeInsets.only(left: 5, top: 10),
        child: Text('Mustafa Dilmaç',
            style: appTextStyle.get_SfProRounded_SemiBold_h4(AppColors.ORANGE)),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('mdilmac9@gmail.com',
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
            const SizedBox(
              height: 5,
            ),
            CustomElevatedButton(
                margin: EdgeInsets.zero,
                width: 140.w,
                height: 20.h,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 3.r,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('Komşularım Beni Görebilir',
                        style: appTextStyle
                            .getSfProDisplayLight_H6(AppColors.WHITE)),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
