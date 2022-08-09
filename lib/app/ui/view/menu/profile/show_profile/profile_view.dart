import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/menu/profile/show_profile/profile_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_appbars/login_appbar.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_outline_textbutton.dart';
import 'package:apmatik/app/ui/widgets/custom_cards/plate_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends BaseView<ProfileController> {
  ProfileView({Key? key})
      : super(
          key: key,
          navBarHide: false, // false
        );
  @override
  Widget vBuilder() => Scaffold(
        backgroundColor: AppColors.PAGEBACKGROUND,
        appBar: CustomLoginUserAppBar(),
        body: buildView(),
      );

  Column buildView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 275.0.h,
          child: Stack(
            children: <Widget>[
              Container(
                color: AppColors.ORANGE,
                width: Get.size.height,
                height: 180.0.h,
              ),
              Positioned(
                top: 10.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  width: 350.w,
                  height: 260.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.0),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.5), width: 1.0),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 0,
                          child: buildUserCardHeader(),
                        ),
                        buildUserPhoneNumber(),
                        buildUserMaritalStatusAndJob(),
                        buildUserChildrenAndPet(),
                        CustomOutlineTextButton(
                          buttonText: 'edit_profile'.tr,
                          onPressed: () {
                            controller.goEditProfileView();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              width: 350.w,
              height: 135.h,
              color: Colors.white,
              child: buildRegisteredCars(),
            ),
            SizedBox(
              height: 10.h,
            ),
            buildAboutMembership(),
          ],
        ),
      ],
    );
  }

  Container buildAboutMembership() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: 350.w,
      height: 125.h,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.h),
            child: Text(
              'about_membership'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),

          ///
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.h),
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
                          WidgetSpan(
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
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.h),
          child: Text(
            'registered_cars'.tr,
            style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
          ),
        ),

        ///
        Expanded(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return PlateCardWidget(
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
                        'DJT 456 61',
                        style: appTextStyle
                            .get_SfProRounded_SemiBold_h5(AppColors.WHITE),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Image.asset(AppAssets.remove_icon))
                    ],
                  )),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: TextButton(
                child: Text("manage_cars".tr,
                    style: AppTextStyle()
                        .getSfProDisplayRegular_H5(AppColors.ORANGE)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: AppColors.ORANGE),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(310.w, 35.h),
                  ),
                ),
                onPressed: () => null),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  Row buildUserChildrenAndPet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text.rich(
            TextSpan(
              text: 'Çocuk Sayısı\n',
              style:
                  appTextStyle.getSfProDisplayRegular_Italic_H6(AppColors.GREY),
              children: [
                TextSpan(
                  text: '2',
                  style:
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
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
              style:
                  appTextStyle.getSfProDisplayRegular_Italic_H6(AppColors.GREY),
              children: [
                TextSpan(
                  text: 'Var',
                  style:
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row buildUserMaritalStatusAndJob() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text.rich(
            TextSpan(
              text: 'Medeni Hali\n',
              style:
                  appTextStyle.getSfProDisplayRegular_Italic_H6(AppColors.GREY),
              children: [
                TextSpan(
                  text: 'Evli',
                  style:
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 40.w),
          child: Text.rich(
            TextSpan(
              text: 'Meslek\n',
              style:
                  appTextStyle.getSfProDisplayRegular_Italic_H6(AppColors.GREY),
              children: [
                TextSpan(
                  text: 'Yazılım Geliştirici',
                  style:
                      appTextStyle.getSfProDisplaySemiBold_h6(AppColors.BLACK),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ListTile buildUserPhoneNumber() {
    return ListTile(
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
    );
  }

  ListTile buildUserCardHeader() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          AppAssets.appbar,
        ),
        radius: 25.r,
      ),
      dense: true,
      title: Padding(
        padding: const EdgeInsets.only(left: 5, top: 15),
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
            SizedBox(
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
                    SizedBox(
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
